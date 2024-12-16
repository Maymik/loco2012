import 'package:flutter/material.dart';


class SelectField extends StatelessWidget {
  const SelectField({
    required this.callback,
    required this.text,
    this.inactiveCallback,
    this.onLongPressCallback,
    super.key,
    required this.backgroundColor,
    this.borderColor =Colors.red,
    this.fontColor = Colors.green,
    this.isActive = true,
    this.horizontalTextPadding = 16,
    this.isLoading = false,
    this.fontSize,
    this.widget,
  });

  final VoidCallback callback;
  final VoidCallback? inactiveCallback;
  final VoidCallback? onLongPressCallback;
  final String text;
  final Color backgroundColor;
  final Color fontColor;
  final Color? borderColor;
  final double? fontSize;
  final double horizontalTextPadding;
  final bool isActive;
  final bool isLoading;
  final Widget? widget;


  @override
  Widget build(BuildContext context) {
    return Container(
          height: 84,
          width: double.infinity,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
            horizontal: horizontalTextPadding,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: borderColor ?? Colors.transparent,
            width: 3),


            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: !isLoading
              ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget != null)
                Row(
                  children: [
                    widget ?? const SizedBox.shrink(),
                    const SizedBox(
                      width: 12,
                    ),
                  ],
                ),
              Flexible(
                child: Text(
                  text,
                  maxLines: 1,
                  style:  const TextStyle(color: Colors.red,fontSize: 40),
                ),
              ),
            ],
          )
              : const Center(child: CircularProgressIndicator()),
    );
  }
}
