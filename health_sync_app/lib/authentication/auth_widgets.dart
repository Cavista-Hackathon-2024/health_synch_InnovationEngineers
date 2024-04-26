import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_sync_app/colors.dart';

class FormattedNumberFeild extends StatelessWidget {
  const FormattedNumberFeild({
    super.key,
    required this.controller,
    this.label = 'Number',
    this.initialValue,
    this.format = "xxx xxx xxxx",
    this.separator = ' ',
  });
  final TextEditingController controller;
  final String format;
  final String separator;
  final String label;
  final String? initialValue;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlignVertical: TextAlignVertical.bottom,
      cursorColor: Colors.black,
      keyboardType: TextInputType.number,
      controller: controller,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9),
          borderSide: const BorderSide(
            color: HealthColors.blue,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        prefixIcon: Container(
          alignment: Alignment.center,
          width: 55,
          height: 50,
          decoration: const ShapeDecoration(
            color: Color.fromARGB(149, 114, 111, 111),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(9),
                bottomLeft: Radius.circular(9),
              ),
            ),
          ),
          child: const Text("+234"),
        ),
        hintText: "X00 000 000",
        hintStyle: const TextStyle(
          color: Color.fromARGB(255, 234, 222, 222),
        ),
      ),
      // ignore: deprecated_member_use
      toolbarOptions: const ToolbarOptions(
        copy: true,
        cut: true,
        paste: false,
        selectAll: false,
      ),
      maxLines: 1,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp("[0-9$separator]")),
        MaskedTextInputFormatter(
          mask: format,
          separator: separator,
        ),
      ],
    );
  }
}

class MaskedTextInputFormatter extends TextInputFormatter {
  final String mask;
  final String separator;
  MaskedTextInputFormatter({
    required this.mask,
    required this.separator,
  });
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isNotEmpty) {
      if (newValue.text.length > oldValue.text.length) {
        if (newValue.text.length > mask.length) return oldValue;
        if (newValue.text.length < mask.length &&
            mask[newValue.text.length - 1] == separator) {
          return TextEditingValue(
            text:
                '${oldValue.text}$separator${newValue.text.substring(newValue.text.length - 1)}',
            selection: TextSelection.collapsed(
              offset: newValue.selection.end + 1,
            ),
          );
        }
      }
    }
    return newValue;
  }
}
