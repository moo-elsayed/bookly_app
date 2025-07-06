import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField(
      {super.key,
      this.onFieldSubmitted,
      required this.controller,
      this.onPressed});

  final void Function(String)? onFieldSubmitted;
  final TextEditingController controller;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        label: const Text('Search'),
        suffixIcon: IconButton(
          onPressed: onPressed,
          icon: const Opacity(
            opacity: .8,
            child: FaIcon(
              FontAwesomeIcons.magnifyingGlass,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}
