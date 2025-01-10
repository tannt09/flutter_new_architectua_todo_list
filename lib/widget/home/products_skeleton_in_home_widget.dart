import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'package:flutter_new_architectua/constants/colors.dart';

class ProductsSkeletonInHomeWidget extends StatelessWidget {
  const ProductsSkeletonInHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: AppColors.grey6,
        highlightColor: Colors.white,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (context, index) {
            return Container(
              width: 170,
              padding: const EdgeInsets.only(right: 14),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          color: AppColors.grey6),
                    ),
                  ),
                  Container(
                    height: 44,
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 6,
                          width: double.infinity,
                          color: AppColors.grey6,
                        ),
                        const SizedBox(height: 5),
                        Container(
                          height: 6,
                          width: 40,
                          color: AppColors.grey6,
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ));
  }
}
