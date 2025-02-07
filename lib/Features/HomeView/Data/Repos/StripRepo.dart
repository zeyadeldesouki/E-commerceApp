import 'package:dartz/dartz.dart';
import 'package:ecommerceapp/Core/Failure.dart';
import 'package:ecommerceapp/Features/HomeView/Data/Models/StripePaymentModels/PaymentIntentParameters/PaymentIntentParameters.dart';

abstract class StripRepo {
  Future <Either<Failure,void>> makePayment(
    {
      required PaymentIntentParameters paymentIntentParameters
    }
  );
}