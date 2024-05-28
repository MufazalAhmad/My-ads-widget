import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class NativeAdSkeleton extends StatelessWidget {
  const NativeAdSkeleton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffdff0df),
      child: Padding(
        padding: const EdgeInsets.only(top: 11, left: 8, right: 8, bottom: 12),
        child: Shimmer.fromColors(
          baseColor: Colors.black.withOpacity(0.1),
          highlightColor: Colors.green.withOpacity(0.2),
          period: const Duration(milliseconds: 1500),

          //  enabled: true,
          enabled: false,

          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Skeleton(height: 70, width: 80),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 7),
                        Skeleton(width: Get.width),
                        const SizedBox(height: 5),
                        const Skeleton(width: 80),
                        const SizedBox(height: 4),
                        const Skeleton(),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Expanded(child: Skeleton(width: Get.width)),
              const SizedBox(height: 6),
              Skeleton(width: Get.width, height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

class SmallNativeAdSkeleton extends StatelessWidget {
  const SmallNativeAdSkeleton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffdff0df),
      child: Padding(
        padding: const EdgeInsets.only(top: 11, left: 8, right: 8, bottom: 12),
        child: Shimmer.fromColors(
          baseColor: Colors.black.withOpacity(0.1),
          highlightColor: Colors.green.withOpacity(0.2),
          period: const Duration(milliseconds: 1500),

          //  enabled: true,
          enabled: false,

          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Skeleton(height: 90, width: 100),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 7),
                        const Skeleton(
                          width: 20,
                          height: 20,
                        ),
                        const SizedBox(
                          height: 4,
                          width: 5,
                        ),
                        const Row(
                          children: [
                            Skeleton(width: 40, height: 30),
                            SizedBox(
                              height: 4,
                              width: 6,
                            ),
                            Column(
                              children: [
                                Skeleton(width: 150, height: 10),
                                SizedBox(height: 4),
                                Row(
                                  children: [
                                    Skeleton(width: 50, height: 10),
                                    Skeleton(width: 50, height: 10),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Skeleton(height: 30, width: Get.width),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SplashNativeAdSkeleton extends StatelessWidget {
  const SplashNativeAdSkeleton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffdff0df),
      child: Padding(
        padding: const EdgeInsets.only(top: 11, left: 8, right: 8, bottom: 12),
        child: Shimmer.fromColors(
          baseColor: Colors.white10.withOpacity(0.25),
          highlightColor: Colors.green.withOpacity(0.2),
          period: const Duration(milliseconds: 1500),
          //  enabled: true,
          enabled: false,

          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Skeleton(height: 70, width: 80),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 7),
                        Skeleton(width: Get.width),
                        const SizedBox(height: 5),
                        const Skeleton(width: 80),
                        const SizedBox(height: 4),
                        const Skeleton(),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Expanded(child: Skeleton(width: Get.width)),
              const SizedBox(height: 6),
              Skeleton(width: Get.width, height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

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

class Skeleton extends StatelessWidget {
  const Skeleton({Key? key, this.height, this.width}) : super(key: key);

  final double? height, width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
    );
  }
}
