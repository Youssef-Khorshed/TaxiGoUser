import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/custom_getplaceaddress.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/custom_select_address_text_form_field.dart';
import 'package:taxi_go_user_version/Features/Map/Controller/mapCubit.dart';
import 'package:taxi_go_user_version/Features/Map/Controller/mapState.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uuid/uuid.dart';

class CustomSearchlist extends StatefulWidget {
  CustomSearchlist({super.key});

  @override
  State<CustomSearchlist> createState() => _CustomSearchlistState();
}

class _CustomSearchlistState extends State<CustomSearchlist> {
  TextEditingController destinationController = TextEditingController();

  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final mapsCubit = context.read<MapsCubit>();
    return Column(
      children: [
        SelectAddressTextFormField(
          suffixicon: destinationController.text.isNotEmpty
              ? IconButton(
                  onPressed: () {
                    destinationController.clear();
                    setState(() {});
                  },
                  icon: const Icon(Icons.close),
                )
              : null,
          hint: AppLocalizations.of(context)!.to,
          focusNode: _focusNode,
          hinttextStyle: AppTextStyles.style16DarkgrayW500,
          onChanged: (value) {
            if (_focusNode.hasFocus && destinationController.text.isEmpty) {
              return;
            }
            mapsCubit.emitPlaceSuggestions(
                searchQuery: value,
                sessionToken: const Uuid().v4(),
                context: context);
          },
          prefixicon: const Icon(
            Icons.location_on_outlined,
          ),
          controller: destinationController,
          textStyle: AppTextStyles.style16DarkgrayW500,
        ),
        BlocBuilder<MapsCubit, MapsState>(
          builder: (context, state) {
            return Container(
              height: 100.h,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: mapsCubit.predictions.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(mapsCubit.predictions[index].description!),
                    onTap: () async {
                      await mapsCubit.emitPlaceLocation(
                          placeId: mapsCubit.predictions[index].placeId!,
                          sessionToken: const Uuid().v4(),
                          context: context);
                      final address = await getAddressFromLatLng(
                          mapsCubit.destinationostion.lat!,
                          mapsCubit.destinationostion.lat!);
                      destinationController.text = address;
                      mapsCubit.predictions.clear();
                      setState(() {});
                    },
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
