import 'package:flutter/material.dart';
import 'package:flutter_new_architectua/constants/colors.dart';
import 'package:flutter_new_architectua/utils/change_image_link.dart';
import 'package:flutter_svg/svg.dart';

class ItemProductWidget extends StatelessWidget {
  const ItemProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 14),
      child: Column(
        children: [
          Stack(
            children: <Widget>[
              Container(
                width: 126,
                height: 98,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(changeImageLink(
                        'http://localhost:3000/images/1732000863903-watch.jpg')),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
              ),
              Positioned(
                top: 6,
                right: 6,
                child: SvgPicture.asset('assets/icons/heart_icon.svg'),
              ),
            ],
          ),
          Container(
            width: 126,
            height: 44,
            decoration: const BoxDecoration(
              color: AppColors.main2,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: const Padding(
                padding: EdgeInsets.only(left: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Watch',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14)),
                    Text('\$40',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: AppColors.main)),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
