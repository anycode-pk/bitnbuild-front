import 'package:flutter/material.dart';
import 'package:bitnbuildfront/minigames/minigame_tiles/minigame_generic_tile.dart';

class MinigameImageTile extends StatefulWidget {
  const MinigameImageTile(
      {super.key,
      required this.tileImage,
      required this.tileEventId,
      required this.disabled,
      required this.callback});
  final AssetImage tileImage;
  final int tileEventId;
  final Function callback;
  final bool disabled;

  @override
  State<MinigameImageTile> createState() => _MinigameImageTile();
}

class _MinigameImageTile extends State<MinigameImageTile> {
  @override
  Widget build(BuildContext context) {
    return MinigameGenericTile(
      callback: widget.callback,
      disabled: widget.disabled,
      tileEventId: widget.tileEventId,
      tileContents: Image(
        image: widget.tileImage,
        fit: BoxFit.cover,
      ),
    );
  }
}
