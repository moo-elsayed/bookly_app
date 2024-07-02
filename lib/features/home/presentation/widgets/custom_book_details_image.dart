import 'package:flutter/material.dart';
class CustomBookDetailsImage extends StatelessWidget {
  const CustomBookDetailsImage({super.key, required this.img});
  final String img;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width* .24),
      child: SizedBox(
        height: MediaQuery.of(context).size.height *.29,
        child: AspectRatio(
          aspectRatio: 2.6/4,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(img),
                  fit: BoxFit.fill),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
      ),
    );
  }
}