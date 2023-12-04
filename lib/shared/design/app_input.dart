import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final String title;
  final double paddingTop, paddingBottom;
  final TextEditingController? controller;
  final bool isPassword;
  final FormFieldValidator<String?>? validator;
  final Function(String)? onChange;

  const CustomTextFormField({
    super.key,
    required this.title,
    this.paddingTop = 16,
    this.paddingBottom = 16,
    this.controller,
    this.isPassword = false,
    this.validator,
    this.onChange,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: widget.paddingBottom,
        top: widget.paddingTop,
      ),
      child: TextFormField(
        controller: widget.controller,
        obscureText: isPasswordHidden && widget.isPassword,
        validator: widget.validator,
        onChanged: widget.onChange,
        decoration: InputDecoration(
          labelText: widget.title,
          labelStyle: const TextStyle(
            color: Colors.white,
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          suffixIcon: widget.isPassword
              ? IconButton(
                  onPressed: () {
                    isPasswordHidden = !isPasswordHidden;
                    setState(
                      () {},
                    );
                  },
                  icon: Icon(
                    isPasswordHidden ? Icons.visibility_off : Icons.visibility,
                  ),
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.white,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
