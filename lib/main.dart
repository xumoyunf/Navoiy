import '../provider/animation_provider.dart';
import '../provider/text_settings.dart';
import 'app_router.dart';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_localizations/syncfusion_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (ctx) => TextSettings()),
    ChangeNotifierProvider(create: (ctx) => AnimationProvider()),
  ], child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        SfGlobalLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('uz'),
      ],
      // locale: const Locale('fr'),
      locale: const Locale('uz', 'UZ'),
      onGenerateRoute: OnGenerateRouter().router,
    );
  }
}
