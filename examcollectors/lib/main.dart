
import 'package:examcollectors/Common/pages.dart';
import 'package:examcollectors/global.dart';
import 'package:examcollectors/services/examProvider.dart';
import 'package:examcollectors/services/pomodoro_study_provider.dart';
import 'package:examcollectors/services/theme_mode_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...NamedRouteSettings.allBlocProviders(context)],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ThemeManager()),
          ChangeNotifierProvider(create: (_) => PomodoroTimerService()),
          ChangeNotifierProvider(create: (_) => ExamTimerProvider()),
        ],
        child: Builder(
          builder: (context) {
            return ScreenUtilInit(
              designSize: const Size(360, 690), // Add your design size
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (context, child) {
                return MaterialApp(
                  theme: ThemeData(
                    colorScheme: ColorScheme.fromSeed(
                      seedColor: Colors.deepPurple,
                    ),
                    useMaterial3: true,
                  ),
                  darkTheme: ThemeData.dark(), // Add dark theme if needed
                  themeMode: context.watch<ThemeManager>().themeMode,
                  debugShowCheckedModeBanner: false,
                  onGenerateRoute: NamedRouteSettings.GenerateRouteSettings,
                  initialRoute: '/', // Add initial route if needed
                );
              },
            );
          },
        ),
      ),
    );
  }
}