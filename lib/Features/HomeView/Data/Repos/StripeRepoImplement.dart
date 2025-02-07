import 'package:dartz/dartz.dart';
import 'package:ecommerceapp/Core/Failure.dart';
import 'package:ecommerceapp/Core/StripeService.dart';
import 'package:ecommerceapp/Features/HomeView/Data/Models/StripePaymentModels/PaymentIntentParameters/PaymentIntentParameters.dart';
import 'package:ecommerceapp/Features/HomeView/Data/Repos/StripRepo.dart';

class Striperepoimplement extends StripRepo {
  final Stripeservice stripeservice;

  Striperepoimplement({required this.stripeservice});
  @override
  Future<Either<Failure, void>> makePayment({
    required PaymentIntentParameters paymentIntentParameters,
  }) async {
    try {
      await stripeservice.makePayment(
        paymentIntentParameters: paymentIntentParameters,
      );
      return right(null);
    } catch (e) {
      return left(Serverfailure(err: e.toString()));
    }
    
  }
}
