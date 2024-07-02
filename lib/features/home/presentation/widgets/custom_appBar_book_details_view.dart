import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBarBookDetailsBody extends StatelessWidget {
  const CustomAppBarBookDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              GoRouter.of(context).pop();
            },
            child: const Icon(Icons.close),
          ),
          GestureDetector(
            onTap: () {},
            child: const Icon(Icons.shopping_cart_outlined),
          )
        ],
      ),
    );
  }
}
