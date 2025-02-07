import 'package:dio/dio.dart';
import 'package:ecommerceapp/Core/ApiService.dart';
import 'package:ecommerceapp/Core/AppStyles.dart';
import 'package:ecommerceapp/Core/BottomNavigation.dart';
import 'package:ecommerceapp/Features/HomeView/Data/Repos/HomeRepoImplement.dart';
import 'package:ecommerceapp/Features/HomeView/Presentation/Manager/AllProduct/all_product_cubit.dart';
import 'package:ecommerceapp/Features/HomeView/Presentation/Manager/PopularProduct/popular_product_cubit.dart';
import 'package:ecommerceapp/Features/HomeView/Presentation/Manager/SpecialProduct/special_product_cubit.dart';
import 'package:ecommerceapp/Features/HomeView/Presentation/Views/Widgets/AllProductBuilder.dart';
import 'package:ecommerceapp/Features/HomeView/Presentation/Views/Widgets/CustomAppBar.dart';
import 'package:ecommerceapp/Features/HomeView/Presentation/Views/Widgets/PopularProductBuilder.dart';
import 'package:ecommerceapp/Features/HomeView/Presentation/Views/Widgets/SpecialProductBuilder.dart';
import 'package:ecommerceapp/Features/HomeView/Presentation/Views/Widgets/SurpriseContainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AllProductCubit(
            HomeRepoImplement(
              ApiService(
                Dio(),
              ),
            ),
          )..getAllProducts(),
        ),
        BlocProvider(
          create: (context) => PopularProductCubit(
            HomeRepoImplement(
              ApiService(
                Dio(),
              ),
            ),
          )..getPopularProducts(),
        ),
        BlocProvider(
          create: (context) => SpecialProductCubit(
            HomeRepoImplement(
              ApiService(
                Dio(),
              ),
            ),
          )..getspecialProducts(),
        ),
      ],
      child: Scaffold(
        bottomNavigationBar: const BottomNavigation(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(
                  child: CustomAppBar(),
                ),
                const SliverToBoxAdapter(
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      SurpriseContainer(),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
                const AllProductBuilder(),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Special for you",
                            style: AppStyles.text14(context),
                          ),
                          Text(
                            "See More",
                            style: AppStyles.text14(context),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
                const SpecialProductBuilder(),
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Popular Product",
                            style: AppStyles.text14(context),
                          ),
                          Text(
                            "See More",
                            style: AppStyles.text14(context),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
                const PopularProductBuilder(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
