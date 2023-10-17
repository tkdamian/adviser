import 'package:adviser/presentation/application/bloc/advice_bloc.dart';
import 'package:adviser/presentation/pages/adviser_page.dart';
import 'package:adviser/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adviser',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      home: BlocProvider(
        create: (context) => AdviceBloc(),
        child: const AdviserPage(),
      ),
    );
  }
}
