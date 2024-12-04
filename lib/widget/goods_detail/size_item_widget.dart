import 'package:flutter/material.dart';
import 'package:flutter_new_architectua/constants/colors.dart';
import 'package:flutter_new_architectua/model/goods_model.dart';

class SizeItemWidget extends StatelessWidget {
  final GoodsModel itemDetail;
  const SizeItemWidget({super.key, required this.itemDetail});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        height: 44,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: itemDetail.sizeProduct.length,
            itemBuilder: (context, index) {
              final item = itemDetail.sizeProduct[index];
              return CustomPaint(
                size: const Size(44, 44),
                painter: item.quantity == 0 ? DiagonalLinePainter() : null,
                child: Container(
                  margin: const EdgeInsets.only(right: 10),
                  width: 44,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border: Border.all(
                        color: AppColors.grey6,
                        width: 1,
                      )),
                  child: Text(
                    "${item.size}",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color:
                            item.quantity == 0 ? AppColors.grey : Colors.black),
                  ),
                ),
              );
            }));
  }
}

class DiagonalLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.grey
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    canvas.drawLine(const Offset(32, 0), const Offset(4, 41), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
