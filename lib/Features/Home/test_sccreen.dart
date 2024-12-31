import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Services/services_locator.dart';

import 'package:taxi_go_user_version/Core/Utils/Routing/app_routes.dart';
import 'package:taxi_go_user_version/Features/Chat/model_view/manger/chat/chat_cubit.dart';
import 'package:taxi_go_user_version/Features/Home/controller/ride_complete_cubit/ride_complete_details_cubit.dart';

class TestSccreen extends StatelessWidget {
  const TestSccreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Center(
          child: GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, AppRoutes.cancelbooing);
            },
            child: Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(child: Text("cancel")),
            ),
          ),
        ),
        Center(
          child: GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, AppRoutes.generalScreen);
            },
            child: Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(child: Text("home")),
            ),
          ),
        ),
        Center(
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.wallet);
            },
            child: Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(child: Text("wallet")),
            ),
          ),
        ),
        Center(
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.chat);
            },
            child: Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(child: Text("chat")),
            ),
          ),
        ),
        BlocBuilder<RideCompleteDetailsCubit, RideCompleteDetailsState>(
          builder: (context, state) {
            return Center(
              child: GestureDetector(
                onTap: () async {
                  Navigator.pushNamed(context, AppRoutes.payment);
                },
                child: Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(child: Text("payment")),
                ),
              ),
            );
          },
        ),
        BlocProvider(
          create: (context) => getIt<ChatCubit>(),
          child: BlocBuilder<ChatCubit, ChatState>(
            builder: (context, state) {
              return Center(
                child: GestureDetector(
                  onTap: () async {
                    BlocProvider.of<ChatCubit>(context).clearMessages();
                  },
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(child: Text("clear")),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    ));
  }
}
