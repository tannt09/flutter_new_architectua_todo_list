import 'package:flutter/material.dart';
import 'package:flutter_new_architectua/constants/colors.dart';
import 'package:flutter_new_architectua/core/bloc/goods/goods_bloc.dart';
import 'package:flutter_new_architectua/main.dart';
import 'package:flutter_svg/svg.dart';

class SearchWidget extends StatelessWidget {
  final TextEditingController controller;
  const SearchWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: AppColors.main2,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 14),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: SizedBox(
                width: 24,
                height: 24,
                child: SvgPicture.asset(
                  'assets/icons/search_icon.svg',
                  colorFilter:
                      const ColorFilter.mode(AppColors.grey2, BlendMode.srcIn),
                ),
              ),
            ),
            Expanded(
              child: TextField(
                controller: controller,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search here',
                  hintStyle: TextStyle(color: AppColors.grey3, fontSize: 14),
                ),
                onSubmitted: (String value) {
                  blocGoods.add(GetSearchGoodsEvent(name: value));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
