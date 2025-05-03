import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';

import '../../../utils/AppColorCollections.dart';
import '../../../utils/constants.dart';
import '../../../widgets/AllCommonWidget.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: Container(
            margin: EdgeInsets.all(15),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                size: 35,
              ),
            ),
          ),
          backgroundColor: ColorCollections.PrimaryColor,
        ),
        backgroundColor: ColorCollections.PrimaryColor,
        body: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          margin: const EdgeInsets.only(
            top: 60,
          ),
          child: CarouselSlider.builder(
            itemCount: AccountInformation().length,
            options: CarouselOptions(
              viewportFraction: 0.66,
              autoPlay: true,
              enlargeCenterPage: true,
              // aspectRatio: 19 / 6,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
              height: 560,
            ),
            // carouselController: ,
            itemBuilder: (context, index, realIndex) {
              return InkWell(
                onTap: () {
                  if (index == 0) {
                    //impliment navigation to the screenshot send screen
                    Navigator.of(context).pushNamed('/sendscreenshot_page');
                  } else if (index == 1) {
                    //go to
                    Navigator.of(context).pushNamed('/sendscreenshot_page');
                  } else if (index == 2) {
                    //navigate
                    Navigator.of(context).pushNamed('/sendscreenshot_page');
                  } else {
                    print('error');
                  }
                },
                child: paymentContainer(
                  assetText: AccountInformation()[index]['bankImage'],
                  AccountNu: AccountInformation()[index]['AccountNumber'],
                  Name: AccountInformation()[index]['Name'],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget paymentContainer({
    required String assetText,
    required String AccountNu,
    required String Name,
  }) {
    return ListView(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 10),
          child: Column(
            children: [
              Container(
                height: 200,
                width: 300,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(2, 2),
                      color: Colors.grey.shade200,
                    )
                  ],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/Images/$assetText'),
                  ),
                ),
              ),
              Container(
                height: 250,
                width: 200,
                margin: const EdgeInsets.only(top: 30),
                decoration: BoxDecoration(
                  color: ColorCollections.GreyColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    ReusableText(
                      FromLeft: 17,
                      TextColor: Colors.black,
                      TextString: 'Account Number : $AccountNu',
                      FontSize: 20,
                    ),
                    ReusableText(
                      FromLeft: 17,
                      TextColor: Colors.black,
                      TextString: 'Name : $Name',
                      FontSize: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
