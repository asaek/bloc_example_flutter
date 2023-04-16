import 'package:bloc_hey_gonza/home/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gif_repository/gif_repository.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => GifRepository(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bloc Example',
        home: HomePage(),
      ),
    );
  }
}
