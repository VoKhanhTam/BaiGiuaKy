import 'package:flutter/material.dart';
import 'package:news_app_ui/gen/assets.gen.dart';

class MyCategory {
  final String name;
  final String image;

  MyCategory({required this.name,required this.image,});
}

class MyData {
  final String name;
  final String author;
  final String image;

  MyData({required this.name, required this.author,required this.image,});
}
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ứng dụng Tin tức',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  void _onCategoryClick(BuildContext context, MyCategory category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CategoryDetailsScreen(category: category),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ứng dụng Tin tức'),
      ),
      body: ListView.builder(
        itemCount: myCategory.length,
        itemBuilder: (context, index) {
          final category = myCategory[index];
          return GestureDetector(
            onTap: () => _onCategoryClick(context, category),
            child: ListTile(
              title: Text(category.name),
              leading: Image.asset(category.image),
            ),
          );
        },
      ),
    );
  }
}

class CategoryDetailsScreen extends StatelessWidget {
  final MyCategory category;

  CategoryDetailsScreen({required this.category});

  @override
  Widget build(BuildContext context) {
    // Filter the MyData list based on the selected category
    final filteredData = myDataList.where((data) => data.name == category.name).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.name),
      ),
      body: ListView.builder(
        itemCount: filteredData.length,
        itemBuilder: (context, index) {
          final data = filteredData[index];
          return ListTile(
            title: Text(data.name),
            subtitle: Text(data.author),
            leading: Image.asset(data.image),
          );
        },
      ),
    );
  }
}

 List<MyCategory> myCategory = [
  MyCategory(name: 'Politics', image: Assets.images.list1.path),
  MyCategory(name: 'Business', image: Assets.images.list1.path),
  MyCategory(name: 'Investment', image: Assets.images.list1.path),
  MyCategory(name: 'Durian', image: Assets.images.list1.path),
   MyCategory(name: 'Tam', image: Assets.images.list1.path),
];

List<MyData> myDataList = [
  MyData(name: 'All basic commodities stable: Trade Minister', author: 'Nakamura',image:Assets.images.list1.path),
  MyData(name: 'All basic commodities stable: Trade Minister', author: 'Nakamura',image:Assets.images.list2.path),
  MyData(name: '101 homes damaged in North Halmahera quake', author: 'Nakamura',image:Assets.images.list3.path),
  MyData(name: 'Increase education, research budget for improved ', author: 'Nakamura',image:Assets.images.list4.path),
  MyData(name: 'Text education, research budget for improved ', author: 'Nakamura',image:Assets.images.list1.path),
];