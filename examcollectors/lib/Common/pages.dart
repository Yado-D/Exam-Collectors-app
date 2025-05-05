import 'package:examcollectors/Common/name.dart';
import 'package:examcollectors/Models/UserModels.dart';
import 'package:examcollectors/Pages/ExamPage/Bloc/exam_bloc.dart';
import 'package:examcollectors/Pages/ExamPage/pages/exam_page.dart';
import 'package:examcollectors/Pages/ExamStartedPage/pages/exam_started_page.dart';

import 'package:examcollectors/Pages/HomePage/blocs/homePageBloc.dart';
import 'package:examcollectors/Pages/HomePage/pages/HomePage.dart';
import 'package:examcollectors/Pages/Settings%20page/pages/settingsPage.dart';
import 'package:examcollectors/Pages/SignInPage/Page/Sign_in_page.dart';
import 'package:examcollectors/Pages/SignUpPage/Pages/Sign_up_page.dart';
import 'package:examcollectors/Pages/Welcome%20Pages/WelcomePageOnlyTeacher/teacher_info_bloc.dart';
import 'package:examcollectors/Pages/Welcome%20Pages/welcomePage1/UI/welcomePage1.dart';
import 'package:examcollectors/Pages/Welcome%20Pages/welcomePage2/Bloc/welcomePage2Bloc.dart';
import 'package:examcollectors/Pages/Welcome%20Pages/welcomePage2/UI/WelcomePage2.dart';
import 'package:examcollectors/Pages/Welcome%20Pages/welcomePage3/UI/WelcomePage3.dart';
import 'package:examcollectors/Pages/Welcome%20Pages/welcomePage4/UI/WelcomePage4.dart';
import 'package:examcollectors/Pages/help-faq-about%20pages/about_page.dart';
import 'package:examcollectors/Pages/help-faq-about%20pages/faq.dart';
import 'package:examcollectors/Pages/help-faq-about%20pages/help_page_all_part.dart';
import 'package:examcollectors/Pages/premium/pages/premiumPages.dart';
import 'package:examcollectors/Pages/premium/pages/sendScreenshot.dart';
import 'package:examcollectors/Pages/premium/pages/verifyPage.dart';
import 'package:examcollectors/Pages/resultPage/page/resultPage.dart';
import 'package:examcollectors/Pages/searchPage/page/search_page.dart';
import 'package:examcollectors/global.dart';
import 'package:examcollectors/utils/constants.dart';
import 'package:examcollectors/widgets/simple_pages/account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Pages/SignInPage/Bloc/SignInBloc.dart';
import '../Pages/SignUpPage/Bloc/SignUpBloc.dart';
import '../Pages/Welcome Pages/welcomePage3/Bloc/WelcomePage3Bloc.dart';
import '../Pages/Welcome Pages/welcomePage4/Bloc/WelcomePage4Bloc.dart';
import '../Pages/premium/pages/payingMethods.dart';

class NamedRouteSettings {
  NamedRouteSettings({required BuildContext context});

  static List<pageEntity> allPages() {
    return [
      pageEntity(
        route: NamedRoutes.WELCOCME_PAGE1,
        page: const WelcomePage1(),
      ),
      pageEntity(
        route: NamedRoutes.WELCOCME_PAGE2,
        page: const WelcomePage2(),
        bloc: BlocProvider(
          create: (_) => WelcomePage2Bloc(),
        ),
      ),

      pageEntity(
        route: NamedRoutes.WELCOCME_PAGE2,
        page: const WelcomePage2(),
        bloc: BlocProvider(
          create: (_) => TeacherInfoBloc(),
        ),
      ),
      pageEntity(
        route: NamedRoutes.WELCOCME_PAGE3,
        page: const WelcomePage3(),
        bloc: BlocProvider(
          create: (_) => Welcomepage3bloc(),
        ),
      ),
      pageEntity(
        route: NamedRoutes.WELCOCME_PAGE4,
        page: const Welcomepage4(),
        bloc: BlocProvider(
          create: (_) => Welcomepage4blocs(),
        ),
      ),
      pageEntity(
        route: NamedRoutes.SIGNIN_PAGE,
        page: const SignInPage(),
        bloc: BlocProvider(
          create: (_) => SignInBloc(),
        ),
      ),
      pageEntity(
        route: NamedRoutes.SIGNUP_PAGE,
        page: const SignUpPage(),
        bloc: BlocProvider(
          create: (_) => SignUpBloc(),
        ),
      ),
      pageEntity(
        route: NamedRoutes.HOME_PAGE,
        page: const home_page(),
      ),
      pageEntity(
        route: NamedRoutes.PREMIUM_PAGE,
        page: const Premiumpages(),
      ),
      pageEntity(
        route: NamedRoutes.HOME_PAGE,
        page: const home_page(),
        bloc: BlocProvider(
          create: (_) => HomePageBloc(),
        ),
      ),
      pageEntity(
        route: NamedRoutes.EXAM_PAGE,
        page: exam_page(),
        bloc: BlocProvider(
          create: (_) => ExamBloc(),
        ),
      ),
      pageEntity(
        route: NamedRoutes.EXAM_STARTED_PAGE,
        page:  ExamStartedPage(),
        // bloc: BlocProvider(
        //   create: (_) => HomePageBloc(),
        // ),
      ),
      pageEntity(
        route: NamedRoutes.RESULT_PAGE,
        page: const result_page(),
        // bloc: BlocProvider(
        //   create: (_) => HomePageBloc(),
        // ),
      ),
      pageEntity(
        route: NamedRoutes.SEARCH_PAGE,
        page: const search_page(),
        // bloc: BlocProvider(
        //   create: (_) => HomePageBloc(),
        // ),
      ),
      pageEntity(
        route: NamedRoutes.SETTINGS_PAGE,
        page: const SettingsPage(),
        // bloc: BlocProvider(
        //   create: (_) => HomePageBloc(),
        // ),
      ),
      pageEntity(
        route: NamedRoutes.ACCOUNT_PAGE,
        page: const account_page(),
        // bloc: BlocProvider(
        //   create: (_) => HomePageBloc(),
        // ),
      ),
      pageEntity(
        route: NamedRoutes.PAYMENT_PAGE,
        page: const PaymentMethods(),
        // bloc: BlocProvider(
        //   create: (_) => HomePageBloc(),
        // ),
      ),
      pageEntity(
        route: NamedRoutes.CHECKSCREENSHOOT_PAGE,
        page: const SendScreenShot(),
        // bloc: BlocProvider(
        //   create: (_) => HomePageBloc(),
        // ),
      ),
      pageEntity(
        route: NamedRoutes.VERIFY_PAGE,
        page: const VerifyPage(),
        // bloc: BlocProvider(
        //   create: (_) => HomePageBloc(),
        // ),
      ),
      pageEntity(
        route: NamedRoutes.FAQ_PAGE,
        page: const FAQ_pages(),
        // bloc: BlocProvider(
        //   create: (_) => HomePageBloc(),
        // ),
      ),
      pageEntity(
        route: NamedRoutes.HELP_PAGE,
        page: const HelpSection(),
        // bloc: BlocProvider(
        //   create: (_) => HomePageBloc(),
        // ),
      ),
      pageEntity(
        route: NamedRoutes.ABOUT_PAGE,
        page: const AboutPage(),
        // bloc: BlocProvider(
        //   create: (_) => HomePageBloc(),
        // ),
      ),
      pageEntity(
        route: NamedRoutes.TROUBLESHOOTING_PAGE,
        page: const TroubleshootingSection(),
        // bloc: BlocProvider(
        //   create: (_) => HomePageBloc(),
        // ),
      ),
      pageEntity(
        route: NamedRoutes.CONTACT_PAGE,
        page: const ContactSupportSection(),
        // bloc: BlocProvider(
        //   create: (_) => HomePageBloc(),
        // ),
      ),
      pageEntity(
        route: NamedRoutes.USERMANUAL_PAGE,
        page: const UserManualSection(),
        // bloc: BlocProvider(
        //   create: (_) => HomePageBloc(),
        // ),
      ),
    ];
  }

  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in allPages()) {
      if (bloc.bloc != null) blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }

  static MaterialPageRoute GenerateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      var route = allPages().where((element) => element.route == settings.name);
      if (route.isNotEmpty) {
        //check if the user is already logged in to dont exaust user
        // by asking loggin again and again
        bool firstStartApp = Global.storageServices.GetDeviceFirstOpen();
        if (route.first.route == NamedRoutes.WELCOCME_PAGE1 && firstStartApp) {
          print('the user already pass the welcome page 4');
          UserModels? alpha =
              Global.storageServices.getData(AppConstants.USERDATA);
          print(alpha!.userEmail);
          return MaterialPageRoute(
              builder: (_) => home_page(), settings: settings);
        }
        if (route.first.route == NamedRoutes.HOME_PAGE &&
            settings.arguments != null) {
          final arg = settings.arguments;
          if (arg is Map<String, dynamic>?) {
            print('user is  on free type');
            return MaterialPageRoute(
                builder: (_) => home_page(), settings: settings);
          }
        }
        if (route.first.route == NamedRoutes.ACCOUNT_PAGE &&
            settings.arguments != null) {
          final arg = settings.arguments;
          if (arg is Map<String, dynamic>?) {
            print('user is  on free type');
            return MaterialPageRoute(
                builder: (_) => account_page(alpha: arg), settings: settings);
          }
        } else {
          return MaterialPageRoute(
              builder: (_) => route.first.page, settings: settings);
        }
      }
      print('invalid routes');
    }
    return MaterialPageRoute(
        builder: (_) => const WelcomePage1(), settings: settings);
  }
}

class pageEntity {
  String route;
  Widget page;
  dynamic bloc;
  pageEntity({
    required this.route,
    required this.page,
    this.bloc,
  });
}
