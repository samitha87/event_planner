import 'package:event_planner/common/app_colors.dart';
import 'package:event_planner/common/app_constants.dart';
import 'package:event_planner/common/app_text_styles.dart';
import 'package:event_planner/data/models/image_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostCarousel extends StatefulWidget {
  final List<ImageModel> images;
  const PostCarousel({super.key, required this.images});

  @override
  State<PostCarousel> createState() => _PostCarouselState();
}

class _PostCarouselState extends State<PostCarousel> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView.builder(
        itemCount: 10,
        pageSnapping: true,
        controller: _pageController,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(color: Color(AppColors.fontGrey).withOpacity(0.5)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 100.h,
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(widget.images[index].url, fit: BoxFit.cover),
                ),
                Padding(
                  padding: EdgeInsets.all(10.sp),
                  child: Text(widget.images[index].title ?? '', style: AppStyling.w700size16),
                ),
                Padding(
                  padding: EdgeInsets.all(10.sp),
                  child: Text(AppConstants.posts[0]['description'] ?? '', style: AppStyling.w400size14),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
