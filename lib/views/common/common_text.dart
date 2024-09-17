import 'package:flutter/material.dart';
import 'package:user_test/constant/app_colors.dart';

class CommonText extends StatelessWidget {
  const CommonText(
    this.title, {
    super.key,
    this.fontSize,
    this.fontWeight,
    this.textAlign,
    this.textOverflow,
    this.maxLines,
    this.color,
  });
  final String title;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final int? maxLines;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      overflow: textOverflow,
      maxLines: maxLines,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color ?? AppColors.white,
      ),
    );
  }
}
