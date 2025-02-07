// ignore_for_file: non_constant_identifier_names

import 'package:ecommerceapp/Core/AppRoutes.dart';
import 'package:ecommerceapp/Core/Button.dart';
import 'package:ecommerceapp/Features/SplashView.dart/Data/Models/SplashItemModel.dart';
import 'package:ecommerceapp/Features/SplashView.dart/Presentation/Widgets/SplashViewItem.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  int currentindex = 0;

  List<SplashItemModel> items = [
    SplashItemModel(
      image:
          "https://img.freepik.com/free-vector/shopping-cart-with-bags-gifts-concept-illustration_114360-17066.jpg?ga=GA1.1.519639404.1736236398&semt=ais_hybrid",
      title: "Welcome to App, Let's Shop",
    ),
    SplashItemModel(
      image:
          "https://img.freepik.com/free-vector/purchasing-habits-abstract-concept_335657-2995.jpg?ga=GA1.1.519639404.1736236398&semt=ais_hybrid",
      title: "We help people conect with store \naround the world",
    ),
    SplashItemModel(
      image:
          "https://img.freepik.com/free-vector/shopping-cart-with-bags-gifts-concept-illustration_114360-22405.jpg?ga=GA1.1.519639404.1736236398&semt=ais_hybrid",
      title: "We show the easy way to shop \nJust stay at home with us",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.75,
            child: PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  currentindex = value;
                });
              },
              itemCount: items.length,
              itemBuilder: (context, index) {
                return SplashViewItem(
                    image: items[index].image, title: items[index].title);
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(items.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(right: 6.0),
                child: BuildDot(index: index),
              );
            }),
          ),
          const Expanded(
            child: SizedBox(),
          ),
          Button(
            text: "Get Started",
            onPressed: () {
              GoRouter.of(context).push(AppRoutes.kLogin);
            },
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      )),
    );
  }

  AnimatedContainer BuildDot({required int index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: currentindex == index ? 20 : 6,
      height: 6,
      decoration: BoxDecoration(
        color: currentindex == index ? Colors.blue : Colors.grey,
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}
