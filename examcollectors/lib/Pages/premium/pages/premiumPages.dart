import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../utils/AppColorCollections.dart';
import '../../../widgets/AllCommonWidget.dart';
import '../Widgets/PremiumWidget.dart';

class Premiumpages extends StatefulWidget {
  const Premiumpages({super.key});

  @override
  State<Premiumpages> createState() => _PremiumpagesState();
}

class _PremiumpagesState extends State<Premiumpages> {
  @override
  Widget build(BuildContext context) {
    // dynamic userEmails = context.read<SignInBloc>().state;
    // String userEmail = userEmails.email;
    // dynamic userPasswords = context.read<SignInBloc>().state;
    // String userPassword = userPasswords.password;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            const FullPageContainer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReusableText(
                  FromLeft: 30,
                  FromTop: 40,
                  TextString: 'Choose Your Plan',
                  FontSize: 43,
                  TextColor: ColorCollections.SecondaryColor,
                  TextFontWeight: FontWeight.bold,
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 30,
                  ),
                  child: CarouselSlider.builder(
                    itemCount: planList().length,
                    options: CarouselOptions(
                      viewportFraction: 0.56,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      // aspectRatio: 19 / 6,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                      height: 520,
                    ),
                    // carouselController: ,
                    itemBuilder: (context, index, realIndex) {
                      return planList()[index];
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List planList() {
    return [
      pageViews(
        context: context,
        SubscriptionType: 'Free',
        Price: 230,
        time: 'yearly',
        feature1: 'Ask Professor',
        feature2: 'Access To Full\n Exam',
        feature3: 'Access To \nPrivate Chat',
      ),
      pageViews(
        context: context,
        SubscriptionType: 'Premium',
        Price: 230,
        time: 'yearly',
        feature1: 'Ask Professor',
        feature2: 'Access To Full\n Exam',
        feature3: 'Access To \nPrivate Chat',
      ),
      pageViews(
        context: context,
        SubscriptionType: 'Monthly',
        Price: 230,
        time: 'yearly',
        feature1: 'Ask Professor',
        feature2: 'Access To Full\n Exam',
        feature3: 'Access To \nPrivate Chat',
      ),
    ];
  }
}
