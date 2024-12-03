import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timbus_annotations/presentation/bloc/blocs.dart';
import 'package:flutter_timbus_annotations/presentation/screens/screens.dart';
import 'package:flutter_timbus_annotations/config/theme/theme.dart';

void main() => runApp(const BlocProviders());

class BlocProviders extends StatelessWidget {
  const BlocProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MoscaCubit(),
        ),
        BlocProvider(
          create: (context) => TrucoCubit(),
        ),
        BlocProvider(
          create: (context) => GeneralaCubit(),
        ),
        BlocProvider(
          create: (context) => ChinchonCubit(),
        ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Timbus',
      initialRoute: 'home',
      routes: {
        'home': (context) => const HomeScreen(),
        'mosca': (context) => const MoscaScreen(),
        'truco': (context) => const TrucoScreen(),
        'generala': (context) => const GeneralaScreen(),
        'chinchon': (context) => const ChinchonScreen(),
        'rules': (context) => const RulesScreen(),
        'settings': (_) => const SettingsScreen(),
        'mosca_rules':(context) => const MoscaRulesScreen(),
        'truco_rules':(context) => const TrucoRulesScreen(),
        'generala_rules':(context) => const GeneralaRulesScreen(),
        'chinchon_rules':(context) => const ChinchonRulesScreen()
      },
      theme: AppTheme(isDarkMode: false).getLightTheme(),
    );
  }
}
