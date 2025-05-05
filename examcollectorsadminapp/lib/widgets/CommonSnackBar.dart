
import 'package:examcollectorsadminapp/utils/AppColorCollections.dart';
import 'package:examcollectorsadminapp/widgets/allCommonWidgets.dart';
import 'package:flutter/material.dart';

commonSnackBar(BuildContext context, String TextString) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Container(
        height: 150,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 2.0, color: Colors.black),
          borderRadius: BorderRadius.circular(20), // Rounded corners
          boxShadow: const [
            BoxShadow(blurRadius: 10, color: Colors.grey)
          ], // Add a blur effect
        ),
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReusableText(
              TextString: TextString,
              FontSize: 16,
              TextColor: ColorCollections.SecondaryColor,
              TextFontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 1000,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 6),
    ),
  );
}
