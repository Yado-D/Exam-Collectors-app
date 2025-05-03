import 'package:examcollectors/utils/AppColorCollections.dart';
import 'package:examcollectors/widgets/AllCommonWidget.dart';
import 'package:flutter/material.dart';

CommonShowDialogue({
  required BuildContext context,
  required String TitleText,
  required VoidCallback cancelOnTap,
  required VoidCallback confirmOnTap,
}) {
  return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Center(
            child: ReusableText(
              FromTop: 0,
              TextString: TitleText,
              FontSize: 20,
              TextFontWeight: FontWeight.w600,
              TextColor: ColorCollections.SecondaryColor,
            ),
          ),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: confirmOnTap,
                    child: AppButton(
                      ButtonHeight: 50,
                      // ButtonWidth: 10,
                      ContainerColor: ColorCollections.GreyColor,
                      ButtonText: 'Confirm',
                      ButtonColor: ColorCollections.SecondaryColor,
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: cancelOnTap,
                    child: AppButton(
                      ButtonHeight: 50,
                      // ButtonWidth: 150,
                      ContainerColor: Colors.green,
                      ButtonText: 'Cancel',
                      ButtonColor: ColorCollections.WhiteColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      });
}

CommonErrorSnackBar({
  required BuildContext context,
  required String TitleText,
  required VoidCallback cancelOnTap,
  required VoidCallback confirmOnTap,
}) {
  return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Center(
            child: ReusableText(
              FromTop: 0,
              TextString: TitleText,
              FontSize: 26,
              TextFontWeight: FontWeight.w400,
              TextColor: ColorCollections.SecondaryColor,
            ),
          ),
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: confirmOnTap,
                      child: AppButton(
                        ButtonHeight: 50,
                        ButtonWidth: 100,
                        ContainerColor: ColorCollections.GreyColor,
                        ButtonText: 'Confirm',
                        ButtonColor: ColorCollections.SecondaryColor,
                      ),
                    ),
                    InkWell(
                      onTap: cancelOnTap,
                      child: AppButton(
                        ButtonHeight: 50,
                        ButtonWidth: 100,
                        ContainerColor: Colors.green,
                        ButtonText: 'Cancel',
                        ButtonColor: ColorCollections.WhiteColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        );
      });
}
