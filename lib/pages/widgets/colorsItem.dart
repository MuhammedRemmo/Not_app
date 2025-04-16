import 'package:flutter/material.dart';
import 'package:not_app/contsvariable.dart';

class ColorsItem extends StatefulWidget {
  const ColorsItem({
    super.key,
    required this.index, required this.isActiv,
  });

  final int index;
    final bool isActiv ;

  @override
  State<ColorsItem> createState() => _ColorsItemState();
}

class _ColorsItemState extends State<ColorsItem> {

  @override
  Widget build(BuildContext context) {
    return widget.isActiv
        ? Container(
            height: 61,
            width: 61,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              margin: EdgeInsets.all(5),
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: colors[widget.index],
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          )
        : Container(
            margin: EdgeInsets.all(5),
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: colors[widget.index],
              borderRadius: BorderRadius.circular(20),
            ),
          );
  }
}
