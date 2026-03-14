import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:klaket_cine/presentation/features/support_gaza/screens/support_gaza_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'core/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://vynqmypohcgzqgpnfwhi.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZ5bnFteXBvaGNnenFncG5md2hpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTMxODcyNTYsImV4cCI6MjA4ODc2MzI1Nn0.I1WO2FIfOOqA2ne3olhflqq_61pYdC7WGzjvwU9359U',
  );
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
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        );
      },
      home: const SupportGazaScreen(),
    );
  }
}
