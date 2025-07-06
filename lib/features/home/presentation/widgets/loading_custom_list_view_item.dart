import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_fading_widget.dart';

class LoadingCustomListViewItem extends StatelessWidget {
  const LoadingCustomListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomFadingWidget(
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        child: AspectRatio(
          aspectRatio: 2.6 / 4,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
