import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:news_app/Screens/Home.dart';
import 'package:news_app/observer.dart';

bool hasInternet=false;

void main() {
  Bloc.observer = MyBlocObserver();
  final connectionChecker = InternetConnectionChecker.instance;

   final subscription = connectionChecker.onStatusChange.listen(
        (InternetConnectionStatus status) {
      if (status == InternetConnectionStatus.connected) {
        print('Connected to the internet');
        hasInternet=true;
      } else {
        print('Disconnected from the internet');
        hasInternet=false;
      }
    },
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routename,
      routes: {
        HomeScreen.routename: (context) => HomeScreen(),
      },
    );
  }
}