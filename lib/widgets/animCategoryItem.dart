import 'package:flutter/material.dart';

class AnimCategoryItem extends StatefulWidget {
  final CategoryBean categoryBeanItem;

  AnimCategoryItem(this.categoryBeanItem);

  @override
  _AnimCategoryItemState createState() => _AnimCategoryItemState();
}

class _AnimCategoryItemState extends State<AnimCategoryItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: widget.categoryBeanItem.onTap,
      title: Text(
        widget.categoryBeanItem.title,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

Widget buildAnimCategoryItem(CategoryBean item) => ListTile(
      onTap: item.onTap,
      title: Text(
        item.title,
        style: TextStyle(color: Colors.white),
      ),
    );

class CategoryBean {
  IconData icon;
  String title;
  List<CategoryBean> categoryItems;
  void Function()? onTap;

  CategoryBean(this.icon, this.title, this.categoryItems, this.onTap);
}
