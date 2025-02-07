// ignore_for_file: non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:ecommerceapp/Core/ApiKeys.dart';
import 'package:ecommerceapp/Core/ApiService.dart';
import 'package:ecommerceapp/Features/HomeView/Data/Models/StripePaymentModels/PaymentIntentParameters/PaymentIntentParameters.dart';
import 'package:ecommerceapp/Features/HomeView/Data/Models/StripePaymentModels/EphemeralKeyResponse/EphemeralKeyResponse.dart';
import 'package:ecommerceapp/Features/HomeView/Data/Models/StripePaymentModels/initPaymentSheetParameters/initPaymentSheetParameters.dart';
import 'package:ecommerceapp/Features/HomeView/Data/Models/StripePaymentModels/paymentIintentResponse/payment_intent_response.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class Stripeservice {
  final ApiService apiService;

  Stripeservice(this.apiService);

  Future<PaymentIntentResponse> CreatePaymentIntent({
    required PaymentIntentParameters paymentIntentParameters,
  }) async {
    var response = await apiService.Post(
      url: "https://api.stripe.com/v1/payment_intents",
      body: paymentIntentParameters.tojson(),
      token: Apikeys.secretkey,
      contentType: Headers.formUrlEncodedContentType,
    );
    PaymentIntentResponse paymentIntentResponse =
        PaymentIntentResponse.fromJson(response.data);
    return paymentIntentResponse;
  }

  Future<void> initPaymentSheet(
      {required initPaymentSheetParameters initpaymentSheetParameters}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret:
            initpaymentSheetParameters.paymentIntentClientSecret,
        customerEphemeralKeySecret:
            initpaymentSheetParameters.EphemeralKeySecret,
        customerId: initpaymentSheetParameters.CustomerId,
        merchantDisplayName: 'E-Commerce App',
      ),
    );
  }

  Future<void> displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment({
    required PaymentIntentParameters paymentIntentParameters,
  }) async {
    PaymentIntentResponse paymentIntentResponse = await CreatePaymentIntent(
      paymentIntentParameters: paymentIntentParameters,
    );
    var ephemeralKeyResponse = await CreateEphemeralKey(
      customerID: paymentIntentParameters.customerId,
    );
    var initpaymentSheetParameters = initPaymentSheetParameters(
      CustomerId: paymentIntentParameters.customerId,
      paymentIntentClientSecret: paymentIntentResponse.clientSecret!,
      EphemeralKeySecret: ephemeralKeyResponse.secret!,
    );
    await initPaymentSheet(
      initpaymentSheetParameters: initpaymentSheetParameters,
    );
    await displayPaymentSheet();
  }

  Future<EphemeralKeyResponse> CreateEphemeralKey({
    required String customerID,
  }) async {
    var response = await apiService.Post(
        url: "https://api.stripe.com/v1/ephemeral_keys",
        body: {
          "customer": customerID,
        },
        token: Apikeys.secretkey,
        contentType: Headers.formUrlEncodedContentType,
        headers: {
          "Authorization": "Bearer ${Apikeys.secretkey}",
          "Stripe-Version": "2024-12-18.acacia",
        });
    EphemeralKeyResponse ephemeralKeyResponse =
        EphemeralKeyResponse.fromJson(response.data);
    return ephemeralKeyResponse;
  }
}
