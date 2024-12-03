import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_new_architectua/constants/colors.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Container(
          margin: const EdgeInsets.only(left: 20),
          child: CircleAvatar(
            backgroundColor: AppColors.main2,
            child: IconButton(
              icon: SvgPicture.asset('assets/icons/left_arrow_icon.svg'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ),
        title: const Text(
          'Cart',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
        leadingWidth: 60,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20),
            width: 40,
            child: CircleAvatar(
              backgroundColor: AppColors.main2,
              child: IconButton(
                icon: SvgPicture.asset('assets/icons/ellipsis_icon.svg'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
