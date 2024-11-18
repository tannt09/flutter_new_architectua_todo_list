import 'package:flutter/material.dart';
import 'package:flutter_new_architectua/constants/colors.dart';
import 'package:flutter_new_architectua/widget/home/item_product_widget.dart';

class ListProductWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const ListProductWidget({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                InkWell(
                  onTap: onTap,
                  child: const Text(
                    'See All',
                    style: TextStyle(fontSize: 12, color: AppColors.main),
                  ),
                ),
              ],
            )),
        SizedBox(
          height: 142,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) {
              return const ItemProductWidget();
            },
          ),
        ),
      ],
    );
  }
}
