import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:untitled1/ads/presentation/widgets/native_ad_skeleton.dart';

class BannerAdSkeleton extends StatelessWidget {
  const BannerAdSkeleton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffdff0df),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Shimmer.fromColors(
          baseColor: Colors.black.withOpacity(0.05),
          highlightColor: Colors.green.withOpacity(0.2),
          period: const Duration(milliseconds: 1500),
          //   enabled: true,
          enabled: false,

          child: const Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Skeleton(
                    width: 55,
                    height: 45,
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      children: [
                        Skeleton(),
                        SizedBox(height: 5),
                        Skeleton(),
                      ],
                    ),
                  ),
                  SizedBox(width: 8),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
