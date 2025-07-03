import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookDetailsImage extends StatelessWidget {
  const CustomBookDetailsImage({super.key, required this.img});

  final String img;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * .24,
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .29,
        child: AspectRatio(
          aspectRatio: 2.6 / 4,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl: img,
              errorWidget: (context, url, error) => Container(
                color: Colors.grey[600],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
