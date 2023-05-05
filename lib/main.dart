import 'package:dev_app_1/constants/custom_color_schemes.g.dart';
import 'package:dev_app_1/constants/text_theme.dart';
import 'package:dev_app_1/features/authentication/views/login_form_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  /// glue that binds the framework to the Flutter engine.
  /// initialize before calling [runApp]
  WidgetsFlutterBinding.ensureInitialized();

  /// Orientation fix
  /// 앱이 지원할 화면 방향을 설정
  /// 지정된 방향만 지원하도록 설정
  /// setPreferredOrientations = [Future]
  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,

      /// DeviceOrientation.portraitDown,
      /// DeviceOrientation.landscapeLeft,
      /// DeviceOrientation.landscapeRight,
    ],
  );

  /// ThemeMode fix
  /// app 전체에서도 설정 가능하지만
  /// page 마다 설정도 가능함
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    /// print(Orientation.portrait);
    /// print(Orientation.landscape);
    /// print(Orientation.values);
    return MaterialApp(
      title: 'First Dev App',
      debugShowCheckedModeBanner: false,

      /// [themeMode]에서 설정된 mode에 따라 앱 실행됨
      /// [ThemeMode.light] -> ligth만 실행됨
      /// [ThemeMode.dart] -> dark만 실행됨
      themeMode: ThemeMode.system,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: techLightColorScheme,
        textTheme: CustomTextTheme.textTheme,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: techDarkColorScheme,
        textTheme: CustomTextTheme.textTheme,
      ),
      home: const LogInFormView(),
    );
  }
}
