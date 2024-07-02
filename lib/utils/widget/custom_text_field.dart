import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:promilo_test/utils/app_colors.dart';
import 'package:promilo_test/utils/text_styles.dart';

class CustomTextFieldWithLabel extends StatelessWidget {
  final String? label, hint;
  final int? minLine, maxLine;
  final TextInputType? keyboardType;
  final bool noLeadingSpaceforTextAllowed;
  final String? error;
  final Color? filledColor;
  final String? initialValue;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final void Function()? onTap;
  final bool? obscureText;
  final bool readOnly;
  final TextStyle? labelStyle;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputValidator;

  const CustomTextFieldWithLabel({
    super.key,
    this.controller,
    this.labelStyle,
    this.obscureText,
    this.filledColor,
    this.hint,
    this.label,
    this.minLine,
    this.maxLine,
    this.keyboardType = TextInputType.text,
    this.error,
    this.onChanged,
    this.suffixIcon,
    this.validator,
    this.onTap,
    this.noLeadingSpaceforTextAllowed = false,
    this.readOnly = false,
    this.initialValue,
    this.focusNode,
    this.inputValidator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      controller: controller,
      initialValue: initialValue,
obscureText: obscureText ?? false,
      inputFormatters: inputValidator ?? getFormatters(),
      decoration: InputDecoration(
        
        isDense: true,
        fillColor: filledColor,
        enabled: true,
        hintText: hint,
        errorText: error,
        prefixIconConstraints: const BoxConstraints(
          minWidth: 0,
          minHeight: 0,
          maxWidth: 80,
        ),
        hintStyle: TextStyles.textStyleRegular14.apply(
          color: AppColors.grey3,
        ),
        label: Text(
          label ?? "",
          style: labelStyle ?? TextStyles.textStyleRegular14,
        ),
        suffixIcon: suffixIcon,
        alignLabelWithHint: true,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.grey3,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.grey3,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.grey3,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      style: TextStyles.textStyleRegular14,
      autofocus: false,
      // focusNode: _focusnode,
      maxLines: maxLine,
      // controller: _newreplycontroller,
      keyboardType: keyboardType,
      minLines: minLine,
      onChanged: onChanged,
      validator: ((value) => validator?.call(value?.trim())),
      onTap: onTap,

      readOnly: readOnly,
    );
  }

  List<TextInputFormatter> getFormatters() {
    return <TextInputFormatter>[
      if (noLeadingSpaceforTextAllowed) NoLeadingSpaceFormatter()
    ];
  }
}

class NoLeadingSpaceFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.startsWith(' ')) {
      final trimmedText = newValue.text.trimLeft();
      return TextEditingValue(
        text: trimmedText,
        selection: TextSelection.collapsed(offset: trimmedText.length),
      );
    }
    return newValue;
  }
}
