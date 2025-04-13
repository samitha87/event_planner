import 'package:flutter/material.dart';

class HomeCarouselWidget extends StatelessWidget {
  const HomeCarouselWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            child: Image.network('https://cdn.pixabay.com/photo/2017/12/08/11/53/event-party-3005668_1280.jpg', fit: BoxFit.cover),
          );
        },
      ),
    );
  }
}
