import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timbus_annotations/bloc/blocs.dart';
import 'package:flutter_timbus_annotations/screens/screens.dart';
import 'package:flutter_timbus_annotations/theme/theme.dart';

void main() => runApp(const BlocProviders());

class BlocProviders extends StatelessWidget {
  const BlocProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewScoreCubit(),
        ),
        BlocProvider(
          create: (context) => MoscaBloc(),
        ),
        BlocProvider(
          create: (context) => TrucoCubit(),
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
      },
      theme: AppTheme(isDarkMode: false).getLightTheme(),
    );
  }
}
