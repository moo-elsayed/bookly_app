import 'package:flutter/material.dart';
import 'custom_fading_widget.dart';
import 'skeleton_box.dart';

class LoadingBookListViewItem extends StatelessWidget {
  const LoadingBookListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(right: 30),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: SizedBox(
              height: 125,
              child: CustomFadingWidget(
                child: AspectRatio(
                  aspectRatio: 2.7 / 4,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: CustomFadingWidget(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // title placeholder
                  Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: SkeletonBox(height: 20, width: double.infinity),
                  ),
                  // author placeholder
                  Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: SkeletonBox(height: 16, width: 100),
                  ),
                  // price and rating placeholders
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SkeletonBox(height: 20, width: 40),
                      SkeletonBox(height: 20, width: 60),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
