import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_go_user_version/Features/Map/Controller/mapCubit.dart';
import 'package:uuid/uuid.dart';

class CustomBuildlsearchlist extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final MapsCubit mapsCubit;
  const CustomBuildlsearchlist({super.key, required this.mapsCubit});

  @override
  State<CustomBuildlsearchlist> createState() => _CustomBuildlsearchlistState();
}

class _CustomBuildlsearchlistState extends State<CustomBuildlsearchlist> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.mapsCubit.predictions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(widget.mapsCubit.predictions[index].description!),
          onTap: () {
            context.read<MapsCubit>().emitPlaceLocation(
                placeId: widget.mapsCubit.predictions[index].placeId!,
                sessionToken: const Uuid().v4(),
                context: context);
          },
        );
      },
    );
  }
}
