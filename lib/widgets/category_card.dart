import 'package:flutter/material.dart';

class CategoryCard extends StatefulWidget {

  String image;
  String title;

  CategoryCard({this.image, this.title});

  @override
  _CategoryCardState createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 7),
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage("${widget.image}"),
                    fit: BoxFit.cover
                )
            ),
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 3)),
          Text("${widget.title}"),
        ],
      ),
    );
  }
}
