class PaymentIntentParameters {
  final String currency;
  final String amount;
  final String customerId;
  PaymentIntentParameters({required this.currency, required this.amount,required this.customerId});

  tojson() {
    return {
      'currency': currency,
      'amount': '${amount}00',
      'customer': customerId,
    };
  }
}
