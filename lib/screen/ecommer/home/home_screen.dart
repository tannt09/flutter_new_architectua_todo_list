import 'package:flutter/material.dart';
import 'package:flutter_new_architectua/core/navigation/app_navigator.dart';
import 'package:flutter_new_architectua/core/navigation/app_router.gr.dart';
import 'package:flutter_new_architectua/widget/home/carousel_slider_widget.dart';
import 'package:flutter_new_architectua/widget/home/list_product_widget.dart';
import 'package:flutter_new_architectua/widget/home/search_widget.dart';
import 'package:flutter_new_architectua/widget/home/user_information_widget.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final AppNavigator navigator = GetIt.instance.get<AppNavigator>();

  TextEditingController controllerSearch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 25,
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: const BoxDecoration(),
                child: Column(
                  children: <Widget>[
                    const UserInformationWidget(),
                    SearchWidget(controller: controllerSearch),
                    const CarouselSliderWidget(),
                    ListProductWidget(
                      title: 'Featured',
                      onTap: () {
                        navigator.push(ProductsRoute());
                      },
                    ),
                    ListProductWidget(
                      title: 'Most Popular',
                      onTap: () {
                        navigator.push(ProductsRoute());
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
