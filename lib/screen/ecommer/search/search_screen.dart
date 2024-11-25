import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_new_architectua/core/bloc/goods/goods_bloc.dart';
import 'package:flutter_new_architectua/widget/search_widget.dart';
import 'package:flutter_svg/svg.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController controllerSearch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
            padding: EdgeInsets.only(right: 20),
            child: SearchWidget(controller: controllerSearch)),
        leading: IconButton(
          icon: SvgPicture.asset('assets/icons/left_arrow_icon.svg'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        titleSpacing: 0,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: BlocBuilder<GoodsBloc, GoodsState>(
          builder: (context, state) {
            // if (!state.goods.isNotEmpty) {
            //   return const Center(
            //     child: Text("Is empty"),
            //   );
            // }

            return SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Container(
                  decoration: const BoxDecoration(),
                  child: Column(
                    children: <Widget>[
                      // SearchWidget(controller: controllerSearch),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
