import 'package:flutter/material.dart';
import 'package:news_app/Screens/News_item.dart';
import 'package:news_app/Screens/tab_item.dart';
import 'package:news_app/api%20manger/api_manger.dart';
import 'package:news_app/models/SourceResponse.dart';

class TabBarWidget extends StatefulWidget {
  String id;
  TabBarWidget({super.key, required this.id});

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  int selectedIndex = 0;
  late Future<SourceResponse> sourcesFuture;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getSources(widget.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return const Center(child: Text("Something went wrong"));
        }

        var sources = snapshot.data?.sources ?? [];

        return Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(8),
              child: Row(
                children: List.generate(sources.length, (index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: TabItem(
                      source: sources[index],
                      isSelected: selectedIndex == index,
                    ),
                  );
                }),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: ApiManager.getNewsData(sources[selectedIndex].id ?? ""),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return const Center(child: Text("Something went wrong"));
                  }

                  var articles = snapshot.data?.articles ?? [];
                  return ListView.separated(
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 15),
                    itemCount: articles.length,
                    itemBuilder: (context, index) {
                      return NewsItem(articles: articles[index]);
                    },
                  );
                },
              ),
            )
          ],
        );
      },
    );
  }
}
