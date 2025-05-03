//this is for carousel slider image

import 'dart:math';
import 'dart:ui';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:examcollectors/Pages/HomePage/blocs/homePageState.dart';
import 'package:examcollectors/Pages/HomePage/some_utils/some_utils.dart';
import 'package:examcollectors/Pages/HomePage/widgets/toolkitPage.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Models/UserModels.dart';
import '../../../auth/authetication.dart';
import '../../../auth/examFetching.dart';
import '../../../global.dart';
import '../../../utils/AppColorCollections.dart';
import '../../../utils/AppShowDialogueWidget.dart';
import '../../../utils/constants.dart';
import '../../../widgets/AllCommonWidget.dart';
import '../../../widgets/simple_pages/account.dart';
import '../../AskTeacher/askTeachers.dart';
import '../blocs/homePageBloc.dart';
import '../blocs/homePageEvent.dart';
import 'ResourcesPage.dart';
import 'opportunityPage.dart';

String capitalize(String input) {
  if (input.isEmpty) {
    return input;
  }
  return input[0].toUpperCase() + input.substring(1);
}

GlobalKey<ScaffoldState> globalKey = GlobalKey();
Widget DrawerWidgets({
  required String iconText,
  required String ImageType,
  required String Text,
  required Color? color,
}) {
  return Container(
    margin: const EdgeInsets.only(top: 20),
    child: Row(
      children: [
        SizedBox(
          height: 27,
          width: 27,
          child: Image.asset(
            'assets/icons/$iconText.$ImageType',
            color: color,
          ),
        ),
        ReusableText(
          FromLeft: 20,
          TextString: Text,
          FontSize: 17,
          TextFontWeight: FontWeight.bold,
          TextColor: ColorCollections.TextColor,
        ),
      ],
    ),
  );
}

Widget carouselSliderImage({required String carouselImage}) {
  return Container(
    margin: const EdgeInsets.only(right: 10, left: 10),
    height: 100,
    width: 366,
    decoration: BoxDecoration(
      image: DecorationImage(
        fit: BoxFit.fill,
        image: NetworkImage(carouselImage),
      ),
      borderRadius: BorderRadius.circular(20),
    ),
  );
}

Widget sliverButtonTabImage({required String SliverImage}) {
  return Container(
    margin: const EdgeInsets.only(right: 10, top: 25),
    height: 250,
    width: 150,
    decoration: BoxDecoration(
      image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage(
          'assets/icons/$SliverImage.png',
        ),
      ),
      borderRadius: BorderRadius.circular(20),
    ),
  );
}

Widget titleBar(BuildContext context, {required Map<String, dynamic>? alpha}) {
  print(alpha!['userImage']);
  return Container(
    // height: 100,
    margin: const EdgeInsets.only(top: 0, left: 5, right: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            globalKey.currentState!.openDrawer();
          },
          child: Container(
            margin: const EdgeInsets.only(top: 10),
            child: Image.asset('assets/icons/menu.png',
                height: 20, color: Colors.black87),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/search_page');
              },
              child: Container(
                margin: const EdgeInsets.only(right: 25),
                child: Image.asset(
                  'assets/icons/search.png',
                  height: 25,
                  color: Colors.black54,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                // globalKey.currentState!.openDrawer();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => account_page(
                          alpha: alpha,
                        )));
              },
              child: (alpha['userImage'] != null && alpha['userImage'] != '')
                  ? Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        color: ColorCollections.SecondaryColor,
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(alpha['userImage']),
                        ),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(2, 0),
                            color: ColorCollections.SecondaryColor,
                            spreadRadius: 2,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                    )
                  : Container(
                      height: 45,
                      width: 45,
                      margin: EdgeInsets.only(right: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        color: ColorCollections.SecondaryColor,
                        image: const DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/Images/defoult.png'),
                        ),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(2, 0),
                            color: ColorCollections.SecondaryColor,
                            spreadRadius: 2,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                    ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget BottomNavBarWidget({
  required void Function(int index)? ontap,
  required int index,
}) {
  return Container(
    child: BottomNavigationBar(
      onTap: ontap,
      currentIndex: index,
      type: BottomNavigationBarType.shifting,
      unselectedItemColor: ColorCollections.DeepGreyColor,
      selectedItemColor: ColorCollections.WhiteColor,
      items: [
        BottomNavigationBarItem(
            backgroundColor: ColorCollections.TextColor,
            icon: Icon(
              Icons.home,
              size: 30,
              // color: ColorCollections.WhiteColor,
            ),
            label: ''),
        BottomNavigationBarItem(
            backgroundColor: ColorCollections.TextColor,
            icon: Icon(
              Icons.search,
              size: 30,
              // color: ColorCollections.WhiteColor,
            ),
            label: ''),
        BottomNavigationBarItem(
            backgroundColor: ColorCollections.TextColor,
            icon: Icon(
              Icons.note_add,
              size: 30,
              // color: ColorCollections.WhiteColor,
            ),
            label: ''),
        BottomNavigationBarItem(
            backgroundColor: ColorCollections.TextColor,
            icon: Icon(
              Icons.chat_rounded,
              size: 30,
              // color: ColorCollections.WhiteColor,
            ),
            label: ''),
      ],
    ),
  );
}

//url luncher

void launchSocialMedia(String url) async {
  final Uri _url = Uri.parse(url);
  if (await canLaunchUrl(_url)) {
    await launchUrl(_url);
  } else {
    throw 'Could not launch $_url';
  }
}

Widget DrowerWidget({
  required Map<String, dynamic>? alpha,
  required BuildContext context,
}) {
  // print(alpha!["userImage"]);
  return Container(
    color: ColorCollections.PageColor,
    child: Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 50, left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      globalKey.currentState!.openDrawer();
                    },
                    child: (alpha!['userImage'] != null &&
                            alpha['userImage'] != '')
                        ? Container(
                            // margin: const EdgeInsets.only( left: 50),
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(43),
                              color: ColorCollections.SecondaryColor,
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(alpha['userImage']),
                              ),
                              boxShadow: const [
                                BoxShadow(
                                  offset: Offset(2, 0),
                                  color: ColorCollections.SecondaryColor,
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                ),
                              ],
                            ),
                          )
                        : Container(
                            // margin: const EdgeInsets.only( left: 50),
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(43),
                              color: ColorCollections.SecondaryColor,
                              image: const DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage('assets/Images/defoult.png'),
                              ),
                              boxShadow: const [
                                BoxShadow(
                                  offset: Offset(2, 0),
                                  color: ColorCollections.SecondaryColor,
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                ),
                              ],
                            ),
                          ),
                  ),
                  Center(
                    child: ReusableText(
                      FromTop: 10,
                      TextString: alpha['userName'],
                      FontSize: 18,
                      FromLeft: 10,
                      TextFontWeight: FontWeight.bold,
                      TextColor: ColorCollections.SecondaryColor,
                    ),
                  ),
                ],
              ),
              Center(
                child: ReusableText(
                  FromTop: 10,
                  FromBottom: 0,
                  TextString: 'Phone Number',
                  FontSize: 18,
                  TextFontWeight: FontWeight.bold,
                  TextColor: ColorCollections.SecondaryColor,
                ),
              ),
              Center(
                child: ReusableText(
                  FromTop: 0,
                  TextString: alpha['userPhone'],
                  FontSize: 18,
                  TextFontWeight: FontWeight.w400,
                  TextColor: ColorCollections.SecondaryColor,
                ),
              ),
              InkWell(
                onTap: () {
                  // Navigator.of(context)
                  //     .pushNamedAndRemoveUntil('/premium_page', (route) => false);
                },
                child: DrawerWidgets(
                  color: Colors.blue,
                  Text: 'Premium',
                  iconText: 'filled-premium',
                  ImageType: 'png',
                ),
              ),
              InkWell(
                onTap: () => launchSocialMedia("https://t.me/exam_collectors"),
                child: DrawerWidgets(
                  color: ColorCollections.TextColor,
                  Text: 'Check Update',
                  iconText: 'filled-update',
                  ImageType: 'png',
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => AskTeacher()));
                },
                child: DrawerWidgets(
                  color: ColorCollections.TextColor,
                  Text: 'Ask Teachers',
                  iconText: 'filled-teacher',
                  ImageType: 'png',
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/settings_page');
                },
                child: DrawerWidgets(
                  color: ColorCollections.TextColor,
                  Text: 'Settings',
                  iconText: 'settings',
                  ImageType: 'png',
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/help_page');
                },
                child: DrawerWidgets(
                  color: ColorCollections.TextColor,
                  Text: 'Help',
                  iconText: 'help',
                  ImageType: 'png',
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/about_page');
                },
                child: DrawerWidgets(
                  color: ColorCollections.TextColor,
                  Text: 'About',
                  iconText: 'filled-about',
                  ImageType: 'png',
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: 10,
          bottom: 10,
          child: InkWell(
            onTap: () async {
              CommonShowDialogue(
                  cancelOnTap: () {
                    Navigator.of(context).pop();
                  },
                  confirmOnTap: () {
                    authentication().logOutUser();
                    Global.storageServices.setBool(
                        AppConstants.STORAGE_DEVICE_OPENED_FIRST, false);
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/sign_in_page', (routes) => false);
                  },
                  context: context,
                  TitleText: 'Are you sure You want to log out ?');
            },
            child: ReusableText(
              FontSize: 24,
              FromBottom: 20,
              // FromLeft: 160,
              TextString: 'Log Out',
              TextColor: ColorCollections.RedColor,
              TextFontWeight: FontWeight.w900,
            ),
          ),
        ),
      ],
    ),
  );
}

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late Future<List> _fetchCarousel;
  late List _carouselData;
  UserModels? UserData;
  int selectedTabBar = 0;
  @override
  void initState() {
    super.initState();
    _fetchCarousel = fetchingExams().GetCarouselImage();
    _carouselData = []; // Initialize the carousel data
    setState(() {
      getUserInfo();
    });
  }

  Future<void> getUserInfo() async {
    UserData = await Global.storageServices.getData(AppConstants.USERDATA);
  }

  void _launchSocialMedia(String url) async {
    final Uri _url = Uri.parse(url);
    if (await canLaunchUrl(_url)) {
      await launchUrl(_url);
    } else {
      throw 'Could not launch $_url';
    }
  }

  @override
  Widget build(BuildContext context) {
    UserData = Global.storageServices.getData(AppConstants.USERDATA);

    print("this is user data : " + '${UserData!.toJson()}');
    String fullName = "${UserData!.userName}," ?? '';
    String firstName = fullName.split(' ')[0];
    String capitalizedFirstName = capitalize(firstName);
    return Scaffold(
      backgroundColor: Color(0xFFE7F6F2),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorCollections.PageColor,
        title: titleBar(
          context,
          alpha: UserData!.toMap() ?? {},
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: ReusableText(
                FromLeft: 10,
                TextString: " Hello ${capitalizedFirstName}," ?? '',
                FontSize: 20,
                TextFontWeight: FontWeight.w600,
                TextColor: ColorCollections.SecondaryColor,
              ),
            ),
            SliverToBoxAdapter(
                child: Container(
              // height: 60,
              padding: EdgeInsets.symmetric(horizontal: 16,vertical: 5),
              // margin: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                // gradient: LinearGradient(
                //     colors: [Color(0xFFE7F6F2), Colors.grey.shade100]),
                color: ColorCollections.TextColor.withOpacity(0.05),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(),
                    child: ReusableText(
                      FromLeft: 0,
                      TextString: 'Quote of the Day',
                      FontSize: 15,
                      TextColor: Color(0xFF004F59),
                      TextFontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.auto_awesome,
                          color: Colors.teal[400], size: 20),
                      SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          "\" ${QuotesService.getDaily()}\" ",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.teal[900],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )),
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.only(left: 20),
                child: ReusableText(
                  TextString: 'Excel Today!',
                  FontSize: 25,
                  TextColor: Color(0xFF004F59),
                  TextFontWeight: FontWeight.bold,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: FittedBox(
                child: SizedBox(
                  height: 160,
                  width: 326,
                  child: FutureBuilder<List>(
                    future: _fetchCarousel,
                    builder: (context, snap) {
                      if (snap.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (snap.hasError) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.error, color: Colors.red, size: 40),
                              const SizedBox(height: 10),
                              Text(
                                'Failed to load carousel.\n${snap.error}',
                                textAlign: TextAlign.center,
                                style: const TextStyle(color: Colors.red),
                              ),
                            ],
                          ),
                        );
                      }
                      if (!snap.hasData || snap.data!.isEmpty) {
                        return const Center(
                          child: Text(
                            'No carousel data available',
                            style: TextStyle(color: Colors.grey),
                          ),
                        );
                      }

                      // Store fetched data in _carouselData if not already stored
                      if (_carouselData.isEmpty) {
                        _carouselData = snap.data!;
                      }

                      // Success case: Build PageView
                      return PageView(
                        onPageChanged: (index) {
                          context.read<HomePageBloc>().add(
                                CarouselSliderEvent(changedIndex: index),
                              );
                        },
                        children: _carouselData.map((imageData) {
                          final carouselImage = imageData;
                          if (carouselImage == null || carouselImage.isEmpty) {
                            return const Center(
                              child: Text(
                                'Image unavailable',
                                style: TextStyle(color: Colors.grey),
                              ),
                            );
                          }
                          return GestureDetector(
                            // onTap: ()=>_launchSocialMedia(),
                            child: carouselSliderImage(
                              carouselImage: carouselImage,
                            ),
                          );
                        }).toList(),
                      );
                    },
                  ),
                ),
              ),
            ),
            // Dots Indicator
            SliverToBoxAdapter(
              child: BlocBuilder<HomePageBloc, HomePageState>(
                builder: (context, state) {
                  return Center(
                    child: DotsIndicator(
                      position: state is CarouselSliderState
                          ? state.changedIndex.toDouble()
                          : 0,
                      dotsCount: 3,
                      onTap: (index) {
                        // Navigate to specific page if required
                      },
                      decorator: const DotsDecorator(
                        activeSize: Size(15, 15),
                        size: Size(8, 8),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 10,
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                height: 40,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            selectedTabBar = index;
                          });
                          // context.read<HomePageBloc>().add(
                          //       BottomTabBarEvent(SelectedTab: 'all'),
                          //     );
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 10),
                          child: AppButton(
                            ContainerColor: selectedTabBar == index
                                ? Color(0xFF004F59)
                                : Colors.grey.shade400,
                            ButtonText: tabNames[index],
                            ButtonColor: ColorCollections.WhiteColor,
                            ButtonHeight: 30,
                            ButtonWidth: 100,
                            FontSize: 13,
                          ),
                        ),
                      );
                    }),
              ),
            ),
            if (selectedTabBar == 0) toolkitPage(context),
            if (selectedTabBar == 1) resourcePage(),
            if (selectedTabBar == 2) opportunityPage(),
          ],
        ),
      ),
    );
  }

  List<String> tabNames = ["Toolkit", "Popular", "Opportunity"];
  // List<Widget> tabPages = [
  //   toolkitPage(context),
  //   resourcePage(),
  //   opportunityPage(),
  // ];
}

Widget sliverWidget({
  required List<String> ListOfImages,
}) {
  return BlocConsumer<HomePageBloc, HomePageState>(
    listener: (context, state) {
      // TODO: implement listener
    },
    builder: (context, state) {
      Future<List<String>> courseName = fetchingExams().getCourseNames();

      return FutureBuilder<List<String>>(
        future: courseName,
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator()),
            );
          } else if (snap.hasError) {
            return SliverToBoxAdapter(
              child: Center(child: Text('Error: ${snap.error}')),
            );
          } else if (!snap.hasData || snap.data!.isEmpty) {
            return SliverToBoxAdapter(
              child: Center(child: Text('No courses found')),
            );
          } else {
            return SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        context
                            .read<HomePageBloc>()
                            .add(SliverTabSliderEvent(changedIndex: index));
                        // Just navigate to the pages with the arguments it needs
                      },
                      child: Stack(
                        children: [
                          Container(
                            height: 150,
                            width: 180,
                            margin: const EdgeInsets.only(
                                right: 10, bottom: 5, top: 15),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(
                                  'assets/Images/exam.jpeg',
                                ),
                              ),
                            ),
                          ),
                          ReusableText(
                            FromTop: 20,
                            TextString: snap.data![index],
                            FontSize: 20,
                            TextColor: ColorCollections.WhiteColor,
                            TextFontWeight: FontWeight.w900,
                          ),
                          Positioned(
                            bottom: 32,
                            child: ReusableText(
                              FromTop: 20,
                              TextString: 'Practice for exam',
                              FontSize: 20,
                              TextColor: ColorCollections.WhiteColor,
                              TextFontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  childCount: snap.data!.length,
                ),
              ),
            );
          }
        },
      );
    },
  );
}
