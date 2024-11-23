import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_new_architectua/constants/colors.dart';
import 'package:flutter_new_architectua/core/bloc/goods/goods_bloc.dart';
import 'package:flutter_new_architectua/core/navigation/app_navigator.dart';
import 'package:flutter_new_architectua/widget/home/product_item_widget.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class GoodsPage extends StatefulWidget {
  final String title;
  const GoodsPage({super.key, this.title = "Products"});

  @override
  State<GoodsPage> createState() => _GoodsPageState();
}

class _GoodsPageState extends State<GoodsPage> {
  late final AppNavigator navigator = GetIt.instance.get<AppNavigator>();
  late final GoodsBloc bloc = GetIt.instance.get<GoodsBloc>();

  @override
  void initState() {
    super.initState();
    bloc.add(const GetAllGoods());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => bloc,
      child: Scaffold(
        appBar: AppBar(
          title: SizedBox(
              width: MediaQuery.of(context).size.width - 140,
              child: Center(
                  child: Text(widget.title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)))),
          leading: Container(
            margin: const EdgeInsets.only(left: 15),
            child: CircleAvatar(
              backgroundColor: AppColors.main2,
              child: IconButton(
                icon: SvgPicture.asset('assets/icons/left_arrow_icon.svg'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ),
        ),
        body: BlocBuilder<GoodsBloc, GoodsState>(builder: (context, state) {
          if (!state.goods.isNotEmpty) {
            return const Center(
              child: Text("Is empty"),
            );
          }

          return GridView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              childAspectRatio: 1,
            ),
            itemCount: state.goods.length,
            itemBuilder: (context, index) {
              final item = state.goods[index];
              return ItemProductWidget(goods: item);
            },
          );
        }),
      ),
    );
  }
}
