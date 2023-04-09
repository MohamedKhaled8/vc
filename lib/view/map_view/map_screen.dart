import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:vc/helper/caching_data.dart';
import 'package:vc/model/auth/profile_model.dart';
import 'package:vc/view/user_profile/profile_setting_screen.dart';
import 'package:vc/widgets/custom_textform_field.dart';

class MapScreen extends StatefulWidget {
  final int addressIndex;
  const MapScreen({super.key, required this.addressIndex});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final CachingData _controller = CachingData();
  @override
  Widget build(BuildContext context) {
    return PlacePicker(
      apiKey: Platform.isAndroid
          ? "AIzaSyDac-y11aabMrCtzpOuvA_-oS2QNAULyfc"
          : "AIzaSyDac-y11aabMrCtzpOuvA_-oS2QNAULyfc",
      onPlacePicked: (result) async {
        textController[widget.addressIndex].text = result.formattedAddress!;
        Get.back();
      },
      initialPosition: LatLng(CachingData.location?.latitude ?? 45,
          CachingData.location?.longitude ?? 10),
      useCurrentLocation: true,
      resizeToAvoidBottomInset:
          false, // only works in page mode, less flickery, remove if wrong offsets
    );
  }
}
