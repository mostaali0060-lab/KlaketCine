import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:klaket_cine/features/support_gaza/screens/support_gaza_screen.dart';
import 'core/theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const KlaketCineApp());
}

class KlaketCineApp extends StatelessWidget {
  const KlaketCineApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KlaketCine كلاكيت سينما',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar', ''), // Arabic
      ],
      locale: const Locale('ar', ''),
      home: const SupportGazaScreen(),
    );
  }
}
