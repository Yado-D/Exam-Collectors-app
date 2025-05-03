
import 'package:examcollectors/Pages/ExamPage/pages/exam_page.dart';
import 'package:examcollectors/Pages/HomePage/widgets/homePageWidget.dart';
import 'package:examcollectors/Pages/chatPage/pages/chatPageUi.dart';
import 'package:examcollectors/Pages/searchPage/page/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/AppColorCollections.dart';

//this is for the page that need the shaped container

class FullPageContainer extends StatelessWidget {
  const FullPageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/Images/WelcomePageBackgroundImage.jpg'),
        ),
      ),
    );
  }
}

//this is for reusable text

class ReusableText extends StatelessWidget {
  String TextString;
  Color TextColor;
  double FontSize;
  FontWeight TextFontWeight;
  double FromTop;
  double FromLeft;
  double FromRight;
  double FromBottom;

  ReusableText({
    super.key,
    required this.TextString,
    this.TextColor = ColorCollections.TeritiaryColor,
    required this.FontSize,
    this.TextFontWeight = FontWeight.w300,
    this.FromTop = 5,
    this.FromLeft = 5,
    this.FromRight = 5,
    this.FromBottom = 5,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: FromTop,
        left: FromLeft,
        right: FromRight,
        bottom: FromBottom,
      ),
      child: Text(
        TextString,
        overflow: TextOverflow.fade,
        style: TextStyle(
          color: TextColor,
          fontSize: FontSize,
          fontWeight: TextFontWeight,
        ),
      ),
    );
  }
}
//  color: TextColor,
//           fontSize: FontSize,
//           fontWeight: TextFontWeight,
//this is for button that we use in the app

class AppButton extends StatelessWidget {
  String ButtonText;
  double ButtonHeight;
  double ButtonWidth;
  FontWeight ButtonFontWeight;
  double FontSize;
  Color ButtonColor;
  Color ContainerColor;
  AppButton({
    super.key,
    required this.ContainerColor,
    required this.ButtonText,
    this.ButtonColor = ColorCollections.PrimaryColor,
    this.ButtonFontWeight = FontWeight.bold,
    this.ButtonHeight = 30,
    this.ButtonWidth = 70,
    this.FontSize = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10,right: 10,bottom: 10),
      height: ButtonHeight,
      width: ButtonWidth,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: ColorCollections.TeritiaryColor,
            spreadRadius: 0.2,
            blurRadius: 2,
            offset: Offset(1, 1),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
        color: ContainerColor.withOpacity(1),
      ),
      child: Center(
        child: ReusableText(
            TextString: ButtonText,
            FontSize: FontSize,
            TextColor: ButtonColor,
            TextFontWeight:ButtonFontWeight,
        ),
      ),
    );
  }
}
//app bar



AppBar SimpleAppBars(BuildContext context, String title, {bool? isDescription = false}) {
  return AppBar(
    leading: Container(
      margin: EdgeInsets.only(left: 8,bottom: 15),
      child: IconButton(
        onPressed: () {
          if (Navigator.of(context).canPop()) {
            Navigator.of(context).pop();
          } else {
            Navigator.of(context).pushNamed('/home_page');
          }
        },
        icon: Icon(
          Icons.arrow_back_ios,
          size: 23,
          color: Color(0xFF003540),
        ),
      ),
    ),
    backgroundColor: ColorCollections.PageColor,
    automaticallyImplyLeading: false,
    flexibleSpace: Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: const Color.fromARGB(255, 203, 203, 203),
            width: 1.0,
          ),
        ),
      ),
      height: 120,
      padding: EdgeInsets.only(top: 40, left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          FittedBox(
              child: ReusableText(
                FromLeft: 70,
                TextString: title,
                FontSize: 20,
                TextColor: Color(0xFF003540),
                TextFontWeight: FontWeight.bold,
              ),
          ),
        ],
      ),
    ),
    // actions: [
    //    InkWell(
    //     onTap: () {
    //       // Navigator.of(context).pushAndRemoveUntil(
    //       //     MaterialPageRoute(
    //       //       builder: (context) => home_page(),
    //       //     ),
    //       //         (predicate) => false);
    //     },
    //     child: Container(
    //       margin: EdgeInsets.only(right: 15,bottom: 10),
    //       child: Icon(
    //         Icons.cancel,
    //         size: 26,
    //         color: ColorCollections.GreyColor,
    //       ),
    //     ),
    //   )
    // ],
  );
}




//custom drop down menue


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






//reusable text field

Widget reusableTextField({
  double heightOfContainer = 45,
  double heightOfTextField =  50,
  String? icon_name,
  String suffix_icon_name = '',
  required String hintText,
  required String textType,
  required void Function(String values)? onchange,
  double WidthOfContainer = 200,
  double widthOfTextField = 100,
  double FromTop = 0,
  double FromBottom = 0,
  double FromRight = 0,
  double FromLeft = 0,
}) {
  return Container(
    height: heightOfContainer,
    width: WidthOfContainer.w,
    margin: EdgeInsets.only(
      top: FromTop.w,
      bottom: FromBottom.w,
      left: FromLeft.w,
      right: FromRight.w,
    ),
    decoration: BoxDecoration(
      color: ColorCollections.WhiteColor,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: ColorCollections.GreyColor),
      boxShadow: [
        BoxShadow(
          color: ColorCollections.GreyColor,
          spreadRadius: 1,
          offset: Offset(1, 1),
          blurRadius: 3,
        ),
      ]
    ),
    child: Row(
      children: [
      icon_name!=null ?  Container(
          height: 16.w,
          width: 16.w,
          margin: const EdgeInsets.only(left: 17),
          child: Image.asset("assets/icons/$icon_name.png"),
        ):SizedBox(),
        SizedBox(
          height: heightOfTextField,
          width: widthOfTextField.w,
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

List<Widget> bottomNavBarPages({
  required BuildContext context,
}) {
  return [
    HomePageWidget(),
    const search_page(),
    const exam_page(),
    const chatPage(),
  ];
}

// these are the bottom bar widgets

// Widget CommentPageWidget() {
//   return Container(
//     height: 100,
//     color: Colors.green,
//   );
// }
