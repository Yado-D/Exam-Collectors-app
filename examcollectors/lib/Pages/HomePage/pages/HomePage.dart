import 'package:flutter/material.dart';
import '../../../Models/UserModels.dart';
import '../../../auth/examFetching.dart';
import '../../../global.dart';
import '../../../utils/constants.dart';
import '../../../widgets/AllCommonWidget.dart';
import '../widgets/homePageWidget.dart';

class home_page extends StatefulWidget {
  // final Map<String, dynamic>? alpha;
  const home_page({
    // this.alpha,
    super.key,
  });

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  final Future<List> fetchCarousel = fetchingExams().GetCarouselImage();
  List li = [];
  UserModels? userModel;
  int currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    saveCarouselImage();
    getAllUserData();
  }

  Future<void> getAllUserData() async {
    userModel = await Global.storageServices.getData(AppConstants.USERDATA);
    print("* user is on home page *  = user name is :  ${userModel!.userName}");
    setState(() {});
  }

  void saveCarouselImage() async {
    await fetchCarousel.then((onValue) => li = onValue);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // print("this is user data : " + '${userModel!.toJson()}');

    return Scaffold(
      drawer: Drawer(
        child: DrowerWidget(
          alpha: userModel!.toJson() ?? {},
          context: context,
        ),
      ),
      key: drawerGlobalKey,
      body: bottomNavBarPages(
        context: context,
      )[currentIndex],
      bottomNavigationBar: BottomNavBarWidget(
        index: currentIndex,
        ontap: (index) {
          setState(() {});
          currentIndex = index;
        },
      ),
    );
  }
}
