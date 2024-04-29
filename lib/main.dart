import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timbus_annotations/bloc/blocs.dart';
import 'package:flutter_timbus_annotations/bloc/new_score/new_score_cubit.dart';
import 'package:flutter_timbus_annotations/screens/screens.dart';

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
      },
      theme: ThemeData.light().copyWith(
        primaryColor: const Color.fromARGB(255, 250, 229, 210),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 0, 28, 40),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        ),
        scaffoldBackgroundColor: const Color.fromARGB(255, 250, 229, 210),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: const Color.fromARGB(255, 0, 28, 40),
          splashColor: Colors.white.withOpacity(0.5),
          foregroundColor: Colors.white,
        ),
        dividerColor: const Color.fromARGB(255, 0, 28, 40),
        // TODO: dialogTheme: const DialogTheme(),
      ),
    );
  }
}
