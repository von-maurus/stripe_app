class StripeCustomResponse {
  final bool success;
  final String message;
  final String? paymentIntentId;

  StripeCustomResponse({
    required this.success,
    required this.message,
    this.paymentIntentId,
  });
}
