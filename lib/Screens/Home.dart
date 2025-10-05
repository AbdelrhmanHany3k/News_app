import 'package:flutter/material.dart';
import 'package:news_app/Screens/Tab_bar.dart';
import 'package:news_app/api%20manger/api_manger.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String routename = "home";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage("assets/images/pattern.png"),
        ),
      ),
      child: Scaffold(
        drawer: const Drawer(),
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white, size: 25),
          centerTitle: true,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          ],
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          title: const Text(
            "News",
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
          backgroundColor: Colors.green,
        ),
        body:Column(
          children: [
            TabBarWidget(),
            FutureBuilder(future: ApiManager.getnewsdata("abc-news"),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return const Center(child: Text("Something went wrong"));
              }
              var articles=snapshot.data?.articles??[];
              return Expanded(
                child: ListView.separated(separatorBuilder: (context, index) {
                  return SizedBox(height: 20,);
                },
                  itemBuilder: (context, index) {
                  return Text(articles[index].title??"");
                   },itemCount: articles.length,
                ),
              );
            },
            )
          ],
        )
      ),
    );
  }
}