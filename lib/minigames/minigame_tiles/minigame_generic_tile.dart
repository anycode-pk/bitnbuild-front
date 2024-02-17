import 'package:flutter/material.dart';

class MinigameGenericTile extends StatefulWidget {
  const MinigameGenericTile(
      {super.key,
      required this.tileContents,
      required this.tileEventId,
      required this.callback,
      required this.disabled});
  final Widget tileContents;
  final int tileEventId;
  final bool disabled;
  final Function callback;

  @override
  State<MinigameGenericTile> createState() => _MinigameGenericTile();
}

class _MinigameGenericTile extends State<MinigameGenericTile> {
  ColorFilter _getDisabledColorFilter() {
    double opacity = 0.0;
    if (widget.disabled) {
      opacity = 0.6;
    }
    return ColorFilter.mode(
        Colors.white.withOpacity(opacity), BlendMode.colorDodge);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: AspectRatio(
          aspectRatio: 1,
          child: Focus(child: Builder(builder: (BuildContext context) {
            final FocusNode focusNode = Focus.of(context);
            final bool hasFocus = focusNode.hasFocus;
            return GestureDetector(
                onTap: () {
                  if (hasFocus) {
                    focusNode.unfocus();
                  } else {
                    focusNode.requestFocus();
                    widget.callback(widget.tileEventId);
                  }
                },
                child: AnimatedScale(
                    scale: hasFocus ? 1.05 : 1.0,
                    curve: Curves.decelerate,
                    duration: const Duration(milliseconds: 60),
                    child: Card(
                      borderOnForeground: true,
                      elevation: hasFocus ? 10.0 : 5.0,
                      margin: const EdgeInsets.all(16.0),
                      clipBehavior: Clip.antiAlias,
                      semanticContainer: true,
                      child: ColorFiltered(
                          colorFilter: _getDisabledColorFilter(),
                          child: widget.tileContents),
                    )));
          }))),
    );
  }
}
