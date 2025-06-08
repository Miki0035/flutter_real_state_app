import 'package:flutter/material.dart';

class MAvatarCircular extends StatelessWidget {
  const MAvatarCircular({
    super.key,
    required this.image,
    this.width = 120,
    this.height = 120,
    this.isNetworkImage = false,
  });

  final String image;

  final bool isNetworkImage;

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50.0)),
      child: Image(
        image: isNetworkImage ? NetworkImage(image) : AssetImage(image),
        fit: BoxFit.fill,
        width: width,
        height: height,
      ),
    );
  }
}
