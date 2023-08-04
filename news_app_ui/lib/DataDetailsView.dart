import 'package:flutter/material.dart';
import 'package:news_app_ui/gen/assets.gen.dart';

class DataDetailsView extends StatelessWidget {
  final String title;
  final String image;

  DataDetailsView({required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image),
            SizedBox(height: 16),
            Text('Tên loại: $title'),
          ],
        ),
      ),
    );
  }
}