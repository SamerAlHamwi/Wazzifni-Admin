


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import '../../common/style/gaps.dart';



class JobDetailsShimmer extends StatelessWidget {
  const JobDetailsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Gaps.vGap8,
          shimmerBox(height: 150,width: 95.w),
          Gaps.vGap2,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              shimmerBox(
                width: 28.w,
                height: 100,
              ),
              Gaps.hGap2,
              shimmerBox(
                width: 28.w,
                height: 100,
              ),
              Gaps.hGap2,
              shimmerBox(
                width: 28.w,
                height: 100,
              ),
            ],
          ),
          Gaps.vGap2,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              shimmerBox(
                width: 75.w,
                height: 30,
              ),
              Gaps.vGap1,
              shimmerBox(
                width: 50.w,
                height: 30,
              ),
              Gaps.vGap1,
              shimmerBox(
                width: 85.w,
                height: 30,
              ),
            ],
          ),
          Gaps.vGap2,
          shimmerBox(height: 150,width: 95.w),
          Gaps.vGap2,
        ],
      ),
    );
  }


  Widget shimmerBox({required double height,required double width}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}