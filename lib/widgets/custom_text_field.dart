import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final String? hintText;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final Function(String text)? onChange;
  final Icon? icon;
  final bool? filled;
  final Color? fillColor;
  final Color borderColor;
  final TextInputType? keyboardType;
  const CustomTextField({
    Key? key,
    this.hintText,
    this.controller,
    this.focusNode,
    this.inputFormatters,
    this.onChange,
    this.icon,
    this.filled,
    this.fillColor,
    this.borderColor = Colors.black,
    this.keyboardType,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 16,
        ),
        TextFormField(
          controller: widget.controller,
          cursorColor: Colors.blue,
          focusNode: widget.focusNode,
          inputFormatters: widget.inputFormatters,
          keyboardType: widget.keyboardType,
          decoration: InputDecoration(
              hintText: widget.hintText,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black12),
                  borderRadius: BorderRadius.circular(10)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black12),
                  borderRadius: BorderRadius.circular(10)),
              suffixIcon: widget.icon),
          onChanged: widget.onChange != null
              ? (text) => setState(() => widget.onChange!(text))
              : null,
        ),
      ],
    );
  }
}
