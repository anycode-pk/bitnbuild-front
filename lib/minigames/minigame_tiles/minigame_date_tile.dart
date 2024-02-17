import 'package:flutter/material.dart';
import 'package:bitnbuildfront/minigames/minigame_tiles/minigame_generic_tile.dart';

class MinigameDateTile extends StatefulWidget {
  const MinigameDateTile(
      {super.key, required this.tileDate, required this.tileEventId});
  final DateTime tileDate;
  final int tileEventId;

  @override
  State<MinigameDateTile> createState() => _MinigameDateTile();
}

class _MinigameDateTile extends State<MinigameDateTile> {
  @override
  Widget build(BuildContext context) {
    return MinigameGenericTile(
      tileEventId: widget.tileEventId,
      tileContents: 
        Center(
          child: Text(
            "${widget.tileDate.month.toString()}/${widget.tileDate.year.toString()}",
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
    ));
  }
}
