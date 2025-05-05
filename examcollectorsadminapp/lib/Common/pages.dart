
import 'package:examcollectorsadminapp/Common/name.dart';
import 'package:examcollectorsadminapp/pages/HomePage/home.dart';
import 'package:examcollectorsadminapp/pages/NewPostPage/page/PostQuestions/page/post_exam_questions.dart';
import 'package:examcollectorsadminapp/pages/NewPostPage/page/PostQuestions/page/result_operation.dart';
import 'package:examcollectorsadminapp/pages/NewPostPage/page/PostQuestions/page/select_exam_info.dart';
import 'package:examcollectorsadminapp/pages/NewPostPage/page/carouselImage.dart';
import 'package:examcollectorsadminapp/pages/NewPostPage/page/post_page.dart';
import 'package:examcollectorsadminapp/pages/NewPostPage/page/sliverView.dart';
import 'package:examcollectorsadminapp/pages/PermissionPage/page/permisson_page.dart';
import 'package:examcollectorsadminapp/pages/PermissionPage/page/seeUserPermissionsPage.dart';
import 'package:examcollectorsadminapp/pages/SignInPage/Page/Sign_in_page.dart';
import 'package:examcollectorsadminapp/pages/UserInfoPage/page/user_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Pages/SignInPage/Bloc/SignInBloc.dart';

class NamedRouteSettings {
  NamedRouteSettings({required BuildContext context});

  static List<pageEntity> allPages() {
    return [
      pageEntity(
        route: NamedRoutes.SIGNIN_PAGE,
        page: SignInPage(),
        bloc: BlocProvider(
          create: (_) => SignInBloc(),
        ),
      ),
      pageEntity(
        route: NamedRoutes.HOME_PAGE,
        page: HomePage(),
        // bloc: BlocProvider(
        //   create: (_) => SignInBloc(),
        // ),
      ),
      pageEntity(
        route: NamedRoutes.PERMISSION_PAGE,
        page: permission_page(),
        // bloc: BlocProvider(
        //   create: (_) => SignInBloc(),
        // ),
      ),
      pageEntity(
        route: NamedRoutes.NEWPOST_PAGE,
        page: new_post(),
        // bloc: BlocProvider(
        //   create: (_) => SignInBloc(),
        // ),
      ),
      pageEntity(
        route: NamedRoutes.USERINFO_PAGE,
        page: user_info(),
        // bloc: BlocProvider(
        //   create: (_) => SignInBloc(),
        // ),
      ),
      pageEntity(
        route: NamedRoutes.USERREQUEST_PAGE,
        page: see_user_request(),
        // bloc: BlocProvider(
        //   create: (_) => SignInBloc(),
        // ),
      ),
      pageEntity(
        route: NamedRoutes.CAROUSEL_PAGE,
        page: carouselPostImage(),
        // bloc: BlocProvider(
        //   create: (_) => SignInBloc(),
        // ),
      ),
      pageEntity(
        route: NamedRoutes.SLIVERPOST_PAGE,
        page: SliverPostImage(),
        // bloc: BlocProvider(
        //   create: (_) => SignInBloc(),
        // ),
      ),
      pageEntity(
        route: NamedRoutes.POSTQUESIONS_PAGE,
        page: postExamInfo(),
        // bloc: BlocProvider(
        //   create: (_) => SignInBloc(),
        // ),
      ),
      pageEntity(
        route: NamedRoutes.SELECTPOSTINFO,
        page: SelectPostExamInfo(
        ),
        // bloc: BlocProvider(
        //   create: (_) => SignInBloc(),
        // ),
      ),
      pageEntity(
        route: NamedRoutes.RESULT_PAGE,
        page: operation_result(),
        // bloc: BlocProvider(
        //   create: (_) => SignInBloc(),
        // ),
      ),
    ];
  }

  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in allPages()) {
      if (bloc.bloc != null) {
        print(bloc.bloc);
        blocProviders.add(bloc.bloc);
      }
    }
    return blocProviders;
  }

  static MaterialPageRoute GenerateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      var route = allPages().where((element) => element.route == settings.name);
      if (route.isNotEmpty) {
        print('valid route');
        print(route.first.page);
        // make sure to put the one in the comment below here
        return MaterialPageRoute(
            builder: (_) => route.first.page, settings: settings);
      }
      print('invalid routes');
    }
    print('Network error please go to that page again.');
    return MaterialPageRoute(
        builder: (_) => const SignInPage(), settings: settings);
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
//check if the user is already logged in to dont exaust user
// by asking loggin again and again
// bool firstStartApp = Global.storageServices.GetDeviceFirstOpen();
// if (route.first.route == NamedRoutes.WELCOCME_PAGE1 && firstStartApp) {
//   print('the user already pass the welcome page 4');
//   return MaterialPageRoute(
//       builder: (_) => SignInPage(), settings: settings);
// }
// if (route.first.route == NamedRoutes.HOME_PAGE &&
//     settings.arguments != null) {
//   final arg = settings.arguments;
//   if (arg is Map<String, dynamic>?) {
//     print('user is  on free type');
//     return MaterialPageRoute(
//         builder: (_) => home_page(alpha: arg), settings: settings);
//   }
// }
// if (route.first.route == NamedRoutes.ACCOUNT_PAGE &&
//     settings.arguments != null) {
//   final arg = settings.arguments;
//   if (arg is Map<String, dynamic>?) {
//     print('user is  on free type');
//     return MaterialPageRoute(
//         builder: (_) => account_page(alpha: arg), settings: settings);
//   }
// } else {
//   return MaterialPageRoute(
//       builder: (_) => route.first.page, settings: settings);
// }
