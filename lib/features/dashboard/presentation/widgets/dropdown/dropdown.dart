import 'package:de_marketplace/core/providers/auth_provider/auth_provider.dart';
import 'package:de_marketplace/shared/utils/textstyle.dart';
import 'package:flutter/material.dart';

class DropDownItem extends StatefulWidget {
  const DropDownItem(
      {Key? key,
      required this.values,
      required this.decoration,
      required this.onPressed})
      : super(key: key);

  final List<String> values;
  final BoxDecoration decoration;
  final Function(String?) onPressed;

  @override
  State<DropDownItem> createState() => _DropDownItemState();
}

class _DropDownItemState extends State<DropDownItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 5),
        // width: 75,
        decoration: widget.decoration,
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            icon: const Icon(
              Icons.arrow_drop_down_rounded,
              color: Colors.white,
              size: 25,
            ),
            value: Auth.authProvider(context).dropValue,
            onChanged: widget.onPressed,
            items: widget.values.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      value,
                      style: textStyleBig.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ));
  }
}
