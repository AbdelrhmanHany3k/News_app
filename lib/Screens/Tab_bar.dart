import 'package:flutter/material.dart';
import 'package:news_app/Screens/tab_item.dart';
import 'package:news_app/api%20manger/api_manger.dart';
import 'package:news_app/models/SourceResponse.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  FutureBuilder<SourceResponse>(
      future: ApiManager.getSources(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return const Center(child: Text("Something went wrong"));
        }

        var sources = snapshot.data?.sources ?? [];
        return DefaultTabController(
          length: sources.length,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TabBar(
                  isScrollable: true,
                  indicator: BoxDecoration(
                    color: Colors.green, // selected tab background
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.green, width: 2),
                  ),
                  unselectedLabelColor: Colors.black,
                  labelColor: Colors.white,
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: sources
                      .map(
                        (e) => TabItem(source: e),
                  )
                      .toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}