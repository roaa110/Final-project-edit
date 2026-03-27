import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/search.dart';
import 'package:flutter_application_1/classes/colors.dart';
import 'package:flutter_application_1/utils/responsive_size_helper.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:flutter_application_1/classes/navigation.dart';

class Locationuser extends StatelessWidget {
  const Locationuser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: AppColors.ScaffoldBackgroundColor,
           // bottomNavigationBar: const Navigation(),

      body: Stack(
        children: [
          Positioned.fill(
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(31.9539, 35.9106),
                zoom: 14,
              ),
            ),
          ),
          Positioned(
            top: 80,
            left: 16,
            right: 16,
            child: Search(width: responsiveWidth(context, 320)), 
          ),
        ],
      ),
    );
  }
}