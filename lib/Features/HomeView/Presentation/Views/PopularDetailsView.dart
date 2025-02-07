// ignore_for_file: non_constant_identifier_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:ecommerceapp/Core/ApiKeys.dart';
import 'package:ecommerceapp/Core/ApiService.dart';
import 'package:ecommerceapp/Core/AppStyles.dart';
import 'package:ecommerceapp/Core/Button.dart';
import 'package:ecommerceapp/Core/StripeService.dart';
import 'package:ecommerceapp/Features/HomeView/Data/Models/StripePaymentModels/PaymentIntentParameters/PaymentIntentParameters.dart';
import 'package:ecommerceapp/Features/HomeView/Data/Models/item_model/product.dart';
import 'package:ecommerceapp/Features/HomeView/Data/Repos/StripeRepoImplement.dart';
import 'package:ecommerceapp/Features/HomeView/Presentation/Manager/StripePayment/stripe_payment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class PopularDetailsView extends StatelessWidget {
  const PopularDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> productJson =
        GoRouterState.of(context).extra as Map<String, dynamic>;
    final Product product = Product.fromJson(productJson);
    return BlocProvider(
      create: (context) => StripePaymentCubit(
          Striperepoimplement(stripeservice: Stripeservice(ApiService(Dio())))),
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => GoRouter.of(context).pop(),
          ),
        ),
        body: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: CachedNetworkImage(
                      imageUrl: product.image ??
                          "https://storage.googleapis.com/fir-auth-1c3bc.appspot.com/1691073671025-galaxy S21 FE.jpg",
                      fit: BoxFit.fill,
                      height: MediaQuery.sizeOf(context).height * 0.3,
                      width: MediaQuery.of(context).size.width * 0.9,
                      placeholder: (context, url) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                      errorWidget: (context, url, error) {
                        return const Icon(
                          Icons.error,
                          color: Colors.red,
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade400,
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Product Name",
                            style: AppStyles.text20(context).copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            product.title ??
                                "Samsung Galaxy S21 FE 5G (Lavender, 8GB, 128GB Storage)",
                            style: AppStyles.text14(context).copyWith(
                              color: Colors.grey.shade700,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "Description",
                            style: AppStyles.text20(context).copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            product.description ??
                                "Pro-grade Camera with AI Single Take, Portrait Mode, Night Mode and 30X Space zoom. Dual Recording: Film in both wide and selfie angles at the same time | 12MP F1.8 Main Camera (Dual Pixel AF & OIS) + 12MP UltraWide Camera (123° FOV) + 8MP Telephoto Camera (3x Optic Zoom, 30X Space Zoom, OIS) | 32 MP F2.2 Front Camera. 16.28cm (6.4-inch) Dynamic AMOLED 2X Display with120Hz Refresh rate for Smooth scrolling. Intelligent Eye Comfort Shield, New 19.5:9 Screen Ratio with thinner bezel, 1080x2340 (FHD+) Resolution. 5G Ready with Octa-core Exynos 2100 (5nm) Processor. Android 12 operating system. Dual Sim. Iconic Contour Cut Design with 7.9 mm thickness. Gorilla Glass Victus and IP68 Water Resistant.",
                            style: AppStyles.text14(context).copyWith(
                              color: Colors.grey.shade600,
                            ),
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 20),
                    child: StripBlocConsumer(product),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  BlocConsumer<StripePaymentCubit, StripePaymentState> StripBlocConsumer(
      Product product) {
    return BlocConsumer<StripePaymentCubit, StripePaymentState>(
      listener: (context, state) {
        if (state is StripePaymentSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Payment Successful'),
              backgroundColor: Colors.green,
            ),
          );
        } else if (state is StripePaymentFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Payment Failed: ${state.errorMessage}'),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is StripePaymentLoaded) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.black,
            ),
          );
        }
        return Button(
          text: "Buy Now",
          onPressed: () {
            var paymentIntentParameters = PaymentIntentParameters(
              amount: product.price.toString(),
              currency: "USD",
              customerId: Apikeys.customerId,
            );
            BlocProvider.of<StripePaymentCubit>(context)
                .makePayment(paymentIntentParameters: paymentIntentParameters);
          },
        );
      },
    );
  }
}
