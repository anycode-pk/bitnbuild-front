import 'package:flutter/material.dart';
import 'package:bitnbuildfront/minigames/minigame_tiles/minigame_generic_tile.dart';

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
    return MinigameGenericTile(
      tileContents: Image(
        image: widget.tileImage,
        fit: BoxFit.cover,
      ),
    );
  }
}
