import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/customAppFormField.dart';
import 'package:taxi_go_user_version/Features/Map/Controller/map_cubit/mapCubit.dart';
import 'package:taxi_go_user_version/Features/Map/Controller/map_cubit/mapState.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uuid/uuid.dart';

class CustomSearchlist extends StatefulWidget {
  const CustomSearchlist({super.key});

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
        CustomTextFormFiled(
          suffixicon: destinationController.text.isNotEmpty
              ? IconButton(
                  onPressed: () {
                    destinationController.clear();
                    setState(() {});
                  },
                  icon: const Icon(Icons.close),
                )
              : null,
          hintText: AppLocalizations.of(context)!.to,
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
            return SizedBox(
              height: 100.h,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: mapsCubit.predictions.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(mapsCubit.predictions[index].description!),
                    onTap: () async {
                      if (mounted) {
                        final destination = mapsCubit.predictions[index];
                        mapsCubit.predictions.clear();
                        await mapsCubit.emitPlaceLocation(
                            placeId: destination.placeId!,
                            sessionToken: const Uuid().v4(),
                            context: context);
                        await mapsCubit.emitPlaceAddress(
                          isorigin: false,
                          placeLatLng: LatLng(
                            mapsCubit.destinationostion!.lat!,
                            mapsCubit.destinationostion!.lng!,
                          ),
                          sessionToken: const Uuid().v4(),
                          // ignore: use_build_context_synchronously
                          context: context,
                        );

                        destinationController.text =
                            mapsCubit.destinationAddress.formattedAddress!;

                        setState(() {});
                      }
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
