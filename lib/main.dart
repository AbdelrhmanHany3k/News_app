import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Bloc/cubit.dart';
import 'package:news_app/Bloc/states.dart';
import 'package:news_app/Screens/Home.dart';
import 'package:news_app/observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(), // إنشاء الكيوبت هنا
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: HomeScreen.routename,
        routes: {
          HomeScreen.routename: (context) => HomeScreen(),
        },
      ),
    );
  }
}