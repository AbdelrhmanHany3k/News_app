import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/NewsDataResponse.dart';

class NewsItem extends StatelessWidget {
  Articles articles;

  NewsItem({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius:const BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            child: CachedNetworkImage(
              width: double.infinity,
              fit: BoxFit.cover,
              height: 250,
              imageUrl: articles.urlToImage ?? "",
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          Text(
            articles.author ?? "",
            style: TextStyle(fontSize: 15, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            articles.title ?? "",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            articles.description ?? "",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.blueGrey),
          ),
          Text(
            articles.publishedAt?.substring(0, 10) ?? "",
            style: TextStyle(
              color: Colors.black45,
              fontSize: 12,
            ),
            textAlign: TextAlign.end,
          ),
        ],
      ),
    );
  }
}
