import 'package:examcollectorsadminapp/utils/AppColorCollections.dart';
import 'package:examcollectorsadminapp/widgets/allCommonWidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CommonDropdownButtons extends StatelessWidget {
  final List<String> items;
  final void Function(String?)? onChanged;
  final double? marginRight;
  final Color backgroundColor;
  final Color textColor;
  final String? hintText;
  final Widget? prifixIcon; // New: Custom suffix icon
  final IconData defaultDropdownIcon; // New: Custom default dropdown icon

  const CommonDropdownButtons({
    required this.items,
    this.onChanged,
    this.marginRight = 20,
    this.backgroundColor = Colors.white,
    this.textColor = Colors.black,
    this.hintText,
    this.prifixIcon, // Optional custom suffix
    this.defaultDropdownIcon = Icons.arrow_drop_down, // Default icon
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: marginRight ?? 0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(7),
        border: Border.all(color: const Color.fromARGB(255, 190, 190, 190)),
      ),
      child: DropdownButtonFormField<String>(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        isExpanded: true,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: prifixIcon, // Add suffix icon here
        ),
        icon: Icon(defaultDropdownIcon, color: textColor), // Custom dropdown icon
        focusColor: const Color.fromARGB(255, 237, 236, 236),
        style: TextStyle(color: textColor),
        value: items.isNotEmpty ? items.first : null,
        hint: hintText != null
            ? Text(hintText!, style: TextStyle(color: textColor))
            : null,
        items: items.map((item) {
          return DropdownMenuItem<String>(
            value: item,
            child: ReusableText(
              FromLeft: 0,
              FromRight: 0,
              FromTop: 0,
              FromBottom: 0,
              TextColor: textColor,
              TextString: item,
              FontSize: 16,
            ),
          );
        }).toList(),
        onChanged: onChanged ?? (value) {}, // Fallback
      ),
    );
  }
}




Widget PostReusableTextField({
  required BuildContext context,
  required String icon_name,
  String suffix_icon_name = '',
  required String hintText,
  required String textType,
  void Function(String values)? onchange,

  double FromTop = 0,
  double FromBottom = 0,
  double FromRight = 0,
  double FromLeft = 0,
}) {
  return Container(
    height: 50.h,
    margin: EdgeInsets.only(
      top: FromTop.w,
      bottom: FromBottom.w,
      left: FromLeft.w,
      right: FromRight.w,
    ),
    decoration: BoxDecoration(
      color: ColorCollections.WhiteColor,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: ColorCollections.TeritiaryColor),
    ),
    child: Row(
      children: [
        Container(
          height: 16.w,
          width: 16.w,
          margin: const EdgeInsets.only(left: 17),
          child: Image.asset(
            "assets/icons/$icon_name.png",
            color: ColorCollections.SecondaryColor,
          ),
        ),
        SizedBox(
          height: 50.h,
          width: 200.h,
          child: TextField(
            onChanged: (value) => onchange!(value),
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              // suffixIcon: suffixIcon,
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
            ),
            obscureText: textType == "password" ? true : false,
          ),
        ),
        if (!(suffix_icon_name == ''))
          Container(
            height: 16.w,
            width: 16.w,
            margin: const EdgeInsets.only(left: 17),
            child: Image.asset("assets/icons/$suffix_icon_name.png"),
          ),
      ],
    ),
  );
}
