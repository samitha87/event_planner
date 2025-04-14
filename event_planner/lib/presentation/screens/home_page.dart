import 'package:event_planner/common/app_colors.dart';
import 'package:event_planner/common/app_constants.dart';
import 'package:event_planner/common/app_strings.dart';
import 'package:event_planner/common/app_text_styles.dart';
import 'package:event_planner/data/models/image_model.dart';
import 'package:event_planner/data/models/organizers_model.dart';
import 'package:event_planner/domain/services/event_service.dart';
import 'package:event_planner/presentation/widgets/carousel/home_carousel_widget.dart';
import 'package:event_planner/presentation/widgets/carousel/post_carousel.dart';
import 'package:event_planner/presentation/widgets/hyperlinks/all_photos_widget.dart';
import 'package:event_planner/presentation/widgets/list_items/organizers_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final EventService _eventService = EventService();
  List<ImageModel>? _images;
  List<OrganizersModel>? _organizers;
  @override
  void initState() {
    super.initState();
    _eventService.getImages().then((value) {
      setState(() {
        _images = value;
      });
    });
    _eventService.getOrganizers().then((value) {
      setState(() {
        _organizers = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              child: HomeCarouselWidget(images: _images),
            ),
            SizedBox(height: 8.sp),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.sp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_images?[0].title ?? '', style: AppStyling.w600size26),
                  SizedBox(height: 8.sp),
                  Text(AppStrings.eventDescription, style: AppStyling.w400size14.copyWith(color: Color(AppColors.fontGrey))),
                ],
              ),
            ),
            SizedBox(height: 16.sp),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.sp),
              child: Text(AppStrings.eventOrganizer, style: AppStyling.w600size22),
            ),
            SizedBox(height: 16.sp),
            ListView.builder(
              shrinkWrap: true,
              itemCount: _organizers?.length ?? 0,
              itemBuilder: (context, index) => OrganizersWidget(organizer: _organizers?[index] ?? OrganizersModel(name: '', email: '', image: '')),
            ),
            SizedBox(height: 16.sp),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(AppStrings.photoGallery, style: AppStyling.w600size22),
                  AllPhotosWidget(),
                ],
              ),
            ),
            SizedBox(height: 16.sp),
            SizedBox(
              height: 250.h,
              child: PostCarousel(images: _images!),
            ),
            SizedBox(
              height: 1.sp,
              child: Container(
                color: Color(AppColors.fontGrey).withOpacity(0.5),
                width: MediaQuery.of(context).size.width,
                height: 1.h,
              ),
            ),
            SizedBox(height: 16.sp),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('${AppConstants.posts.length}', style: AppStyling.w600size22.copyWith(color: Color(AppColors.primary))),
                      Text(AppStrings.posts, style: AppStyling.w500size13),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.sp),
            SizedBox(
              height: 1.sp,
              child: Container(
                color: Color(AppColors.fontGrey).withOpacity(0.5),
                width: MediaQuery.of(context).size.width,
                height: 1.h,
              ),
            ),
            SizedBox(height: 16.sp),
          ],
        ),
      ),
    );
  }
}
