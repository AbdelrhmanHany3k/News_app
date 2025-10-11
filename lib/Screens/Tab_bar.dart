import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:news_app/Bloc/cubit.dart';
import 'package:news_app/Bloc/states.dart';
import 'package:news_app/Screens/News_item.dart';

class TabBarWidget extends StatelessWidget {
  final String id;
  const TabBarWidget({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      child: BlocProvider(
        create: (context) => HomeCubit()..getSources(id),
        child: BlocConsumer<HomeCubit, HomeStates>(
          listener: (context, state) {
            if (state is HomeGetSourceLoadingState || state is HomeGetNewsDataLoadingState) {
              context.loaderOverlay.show();
            } else {
              context.loaderOverlay.hide();
            }

            if (state is HomeGetSourceErrorState || state is HomeGetNewsDataErrorState) {
              String error = state is HomeGetSourceErrorState ? state.error : "Failed to load news";
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error)));
            }
          },
          builder: (context, state) {
            var cubit = HomeCubit.getCubit(context);
            var sources = cubit.sourceResponse?.sources ?? [];

            if (sources.isEmpty) return const Center(child: Text("No sources available"));

            return DefaultTabController(
              length: sources.length,
              child: Column(
                children: [
                  TabBar(
                    isScrollable: true,
                    indicatorColor: Colors.green,
                    labelColor: Colors.green,
                    unselectedLabelColor: Colors.grey,
                    onTap: (index) {
                      cubit.getNewsData(index);
                    },
                    tabs: sources.map((s) => Tab(text: s.name ?? "")).toList(),
                  ),
                  Expanded(
                    child: BlocBuilder<HomeCubit, HomeStates>(
                      builder: (context, state) {
                        var articles = cubit.newsDataResponse?.articles ?? [];
                        if (articles.isEmpty) return const Center(child: Text("No news found"));

                        return TabBarView(
                          children: sources.map((source) {
                            return ListView.separated(
                              separatorBuilder: (_, __) => const SizedBox(height: 15),
                              itemCount: articles.length,
                              itemBuilder: (_, index) => NewsItem(articles: articles[index]),
                            );
                          }).toList(),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}