import 'package:event_planner/common/app_colors.dart';
import 'package:event_planner/data/models/organizers_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrganizersWidget extends StatefulWidget {
  final OrganizersModel organizer;

  OrganizersWidget({required this.organizer});

  @override
  State<OrganizersWidget> createState() => _OrganizersWidgetState();
}

class _OrganizersWidgetState extends State<OrganizersWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.sp),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 4.sp),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Color(AppColors.fontGrey),
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.sp),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(80),
                      child: Container(
                        width: 44.sp,
                        height: 44.sp,
                        child: Image.network(widget.organizer.image ??
                            'https://s3-alpha-sig.figma.com/img/bb5a/b1e2/6f5aebe7f96f23f10603fcdf8c868631?Expires=1745798400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=GI8GnqbycxMmUgw0gTJ5-vrYEO-nlH8qQp0R8llxqDJYt0o9QqZwKecY3R9d5jzxFAvVh3EJdBrZhk4pQiRjtEMeswncDr1lSeWbJ1IqwujMc5SAXzS5I7h-5~w1iSpqwubIaNGjsJod723LSoAwjX0lX5ZrVjXGM3ffLmmOl18ojb1Ii9lPUC074ybRqg4IbwcGM2bBjsw3nia4EdPgz-jItH4BrUpWB5VH0hsqoIdZdwqx7naYHj7oGg8VOOnjCAFiaHBT8J-teHFCROHi9TSfIDr32K~ZjL1rq0iiQvqjKueiUHXrL9saDJ1cKi2XQCTAtkaVBI48rtPTQtsK5w__'),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.organizer.name),
                    Text(widget.organizer.email),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(Icons.message_outlined),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
