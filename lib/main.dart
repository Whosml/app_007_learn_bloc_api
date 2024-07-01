import 'package:app_007_learn_bloc_api/bloc/home_screen_bloc.dart';
import 'package:app_007_learn_bloc_api/home_screen/home_screen.dart';
import 'package:app_007_learn_bloc_api/home_screen/repository/post_repository.dart';
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
      title: 'L007 bloc API',
      debugShowCheckedModeBanner: false,
      home: BlocProvider<HomeScreenBloc>(
        create: (context) => HomeScreenBloc(
          PostRepository(),
        )..add(
            FetchPosts(),
          ),
        child: const HomeScreen(),
      ),
    );
  }
}