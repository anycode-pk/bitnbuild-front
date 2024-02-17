import 'package:flutter/material.dart';

class MinigameImageTile extends StatefulWidget {
  const MinigameImageTile(
      {super.key, required this.tileImage, required this.tileDate});
  final AssetImage tileImage;
  final DateTime tileDate;

  @override
  State<MinigameImageTile> createState() => _MinigameImageTile();
}

class _MinigameImageTile extends State<MinigameImageTile> {
  @override
  Widget build(BuildContext context) {
      return Expanded(
        flex: 1,
    child: AspectRatio(
        aspectRatio: 1,
        child: Card(
          borderOnForeground: true,
          margin: const EdgeInsets.all(16.0),
          child: Image(image: widget.tileImage,
          fit: BoxFit.cover,),
        )
      )
    );
  }
}
