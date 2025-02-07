import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:ecommerceapp/Features/HomeView/Data/Models/StripePaymentModels/PaymentIntentParameters/PaymentIntentParameters.dart';
import 'package:ecommerceapp/Features/HomeView/Data/Repos/StripeRepoImplement.dart';
import 'package:meta/meta.dart';

part 'stripe_payment_state.dart';

class StripePaymentCubit extends Cubit<StripePaymentState> {
  final Striperepoimplement striperepoimplement;
  StripePaymentCubit(this.striperepoimplement) : super(StripePaymentInitial());
  Future<void> makePayment(
      {required PaymentIntentParameters paymentIntentParameters}) async {
    emit(StripePaymentLoaded());
    var data = await striperepoimplement.makePayment(
      paymentIntentParameters: paymentIntentParameters,
    );
    data.fold((failure) {
      emit(
        StripePaymentFailure(
          errorMessage: failure.err,
        ),
      );
    }, (sucess) {
      emit(
        StripePaymentSuccess(),
      );
    });
  }
  @override
  void onChange(Change<StripePaymentState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
