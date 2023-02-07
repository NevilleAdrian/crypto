import 'package:flutter/material.dart';

enum Type { parent, child }

class TabMenu extends StatelessWidget {
  const TabMenu(
      {this.text, this.onTap, this.decoration, this.style, this.padding});

  final String? text;
  final Function()? onTap;
  final BoxDecoration? decoration;
  final TextStyle? style;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 15),
          decoration: decoration,
          child: Text(
            text!,
            style: style,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
