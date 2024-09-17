import 'package:flutter/material.dart';
import 'package:user_test/constant/app_colors.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField(
      {super.key,
      this.validator,
      this.controller,
      this.hintText,
      this.lableText,
      this.maxLength,
      this.iconData,
      this.onTap,
      this.counterText,
      this.contentPadding,
      this.onChanged,
      this.maxLines,
      this.suffix,
      this.isVisible,
      this.keyboardType});
  final String? Function(String?)? validator;
  final VoidCallback? onTap;
  final TextEditingController? controller;
  final String? hintText;
  final String? lableText;
  final int? maxLength;
  final int? maxLines;
  final bool? isVisible;
  final String? counterText;
  final Widget? suffix;
  final TextInputType? keyboardType;
  final EdgeInsetsGeometry? contentPadding;
  final void Function(String)? onChanged;
  final IconData? iconData;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      onTap: onTap,
      onChanged: onChanged,
      keyboardType: keyboardType,
      obscureText: isVisible ?? false,
      maxLines: maxLines,
      maxLength: maxLength,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        contentPadding: contentPadding,
        prefixIcon: Icon(iconData,color: Colors.blue,),
        suffixIcon: suffix,
        hintText: hintText,
        hintStyle: TextStyle(color: AppColors.white.withOpacity(0.5)),
        labelText: lableText,
        counterText: counterText,
      ),
      style: const TextStyle(color: AppColors.white),
    );
  }
}
