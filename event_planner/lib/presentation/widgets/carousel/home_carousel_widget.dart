import 'package:event_planner/data/models/image_model.dart';
import 'package:flutter/material.dart';

class HomeCarouselWidget extends StatelessWidget {
  final List<ImageModel>? images;
  const HomeCarouselWidget({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView.builder(
        itemCount: images?.length ?? 0,
        itemBuilder: (context, index) {
          return Container(
            child: Image.network(images?[index].url ?? '', fit: BoxFit.cover),
          );
        },
      ),
    );
  }
}
