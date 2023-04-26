import 'package:de_marketplace/features/dashboard/presentation/utils/radii.dart';
import 'package:de_marketplace/features/dashboard/presentation/utils/weights.dart';
import 'package:de_marketplace/shared/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef String? ValidatorCallback(String? value);
typedef OnChangedCallback(String value);
typedef OnTapCallback();

class MyTextForm extends StatefulWidget {
  final TextEditingController? controller;
  final ValidatorCallback? validatorCallback;
  final OnChangedCallback? onChangedCallback;
  final OnTapCallback? onTap;
  final FocusNode? focusNode;
  final EdgeInsets? contentPadding;
  final Color? fillColor;
  final String? errorText;
  final String? labelText;
  final String? hintText;
  final double? hintSize;
  final Color? textColor;
  final FontWeight fontWeight;
  final TextInputType textInputType;
  final FontWeight labelWeight;
  final Color? labelColor;
  final FontStyle labelStyle;
  final Color? hintColor;
  final FontStyle hintStyle;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final String? prefixText;
  final FontWeight prefixWeight;
  final List<TextInputFormatter>? inputFormatter;
  final bool enabled;
  final bool useDefaultSuffix;
  final Color? borderColor;
  final Color? focusBorderColor;
  final double borderWidth;
  final double focusBorderWidth;
  final Color? prefixColor;
  final Widget? suffix;
  final Widget? prefix;
  final int maxLines;
  final int? maxLength;
  final bool isInputRequired;
  final Widget? inputRequiredWidget;
  final EdgeInsets? padding;
  final String? text;
  final bool? readOnly;
  final bool obscureText;
  final double? heightTextForm;

  const MyTextForm({
    this.controller,
    this.validatorCallback,
    this.labelText,
    this.heightTextForm,
    this.hintText,
    required this.textInputType,
    this.focusNode,
    this.fillColor,
    this.contentPadding = EdgeInsets.zero,
    this.inputFormatter,
    this.enabled = true,
    this.prefixText,
    this.suffix,
    this.prefix,
    this.errorText,
    this.onChangedCallback,
    this.onTap,
    this.maxLength,
    this.textColor,
    this.padding,
    this.useDefaultSuffix = false,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.fontWeight = kRegularWeight,
    this.labelStyle = FontStyle.normal,
    this.hintStyle = FontStyle.normal,
    this.labelColor = Colors.grey,
    this.labelWeight = kMediumWeight,
    this.hintColor,
    this.maxLines = 1,
    this.hintSize,
    this.prefixColor,
    this.prefixWeight = kRegularWeight,
    this.borderColor,
    this.focusBorderColor,
    this.borderWidth = 0,
    this.focusBorderWidth = 1,
    this.isInputRequired = false,
    this.inputRequiredWidget,
    this.text,
    this.readOnly,
    this.obscureText = false,
  });

  @override
  _MyTextFormState createState() => _MyTextFormState();
}

class _MyTextFormState extends State<MyTextForm> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: widget.contentPadding!,
          decoration: BoxDecoration(
            borderRadius: Radii.k15pxRadius,
            color: widget.fillColor ?? secondaryColor,
          ),
          child: TextFormField(
              controller: widget.controller,
              keyboardType: widget.textInputType,
              obscureText: widget.obscureText,
              enabled: widget.enabled,
              maxLines: widget.maxLines,
              maxLength: widget.maxLength,
              onTap: widget.onTap,
              readOnly: widget.readOnly ?? false,
              style: theme.primaryTextTheme.bodyText2!.copyWith(
                  color: whiteColor,
                  fontSize: 15,
                  fontWeight: widget.fontWeight),
              validator: widget.validatorCallback,
              inputFormatters: widget.inputFormatter,
              onChanged: widget.onChangedCallback,
              focusNode: widget.focusNode,
              textAlign: widget.textAlign,
              textAlignVertical: widget.textAlignVertical,
              cursorColor: primaryColor,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: widget.fillColor ?? Colors.black,
                  contentPadding: EdgeInsets.symmetric(horizontal: 15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      15,
                    ),
                    borderSide: BorderSide(
                        width: 1, color: whiteColor.withOpacity(0.4)),
                  ),
                  labelText: widget.labelText,
                  labelStyle: TextStyle(
                    color: widget.textColor ?? Colors.white,
                    fontSize: 14,
                  ),
                  prefixIcon: widget.prefix,
                  suffixIcon: widget.suffix,
                  prefixText:
                      widget.prefixText != null ? '${widget.prefixText} ' : '',
                  prefixStyle: theme.textTheme.bodyText2!.copyWith(
                      color: widget.prefixColor ??
                          theme.textTheme.bodyText2!.color,
                      fontWeight: widget.prefixWeight),
                  hintText: widget.hintText,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      15,
                    ),
                    borderSide: BorderSide(
                        width: 1, color: whiteColor.withOpacity(0.4)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      15,
                    ),
                    borderSide: BorderSide(width: 1, color: primaryColor),
                  ))),
        )
      ],
    );
  }
}
