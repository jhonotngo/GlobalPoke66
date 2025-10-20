import 'package:flutter/material.dart';

class ImageWithDescription extends StatelessWidget {
  const ImageWithDescription({
    super.key,
    required this.context,
    required this.image,
    required this.title,
    required this.description,
    required this.topRatio,
  });

  final BuildContext context;
  final Image image;
  final String title;
  final String description;
  final double topRatio;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(height: MediaQuery.of(context).size.height * topRatio),
          Center(child: image),
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade900,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            description,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade600,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
