import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:stripe_app/models/stripe_custom_response_model.dart';

class StripeService {
  // Singleton
  StripeService._internal();
  static final StripeService _instance = StripeService._internal();
  factory StripeService() => _instance;

  final String _paymentIntentUrl = "https://api.stripe.com/v1/payment_intents";
  final String _publishableKey = "";

  void init() {
    Stripe.publishableKey = _publishableKey;
    Stripe.merchantIdentifier = 'test';
    Stripe.instance.applySettings();
  }

  Future payWithExistingCard({required String amount, required String currency, required CardDetails card}) async {}

  Future<StripeCustomResponse> payWithNewCard({required String amount, required String currency}) async {
    try {
      final paymentSheet = await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          // Set to true for custom flow
          customFlow: false,
          // Main params
          merchantDisplayName: 'Flutter Stripe Store Demo',
          // paymentIntentClientSecret: data['paymentIntent'],
          // Customer keys
          // customerEphemeralKeySecret: data['ephemeralKey'],
          // customerId: data['customer'],
          // Extra options
          applePay: const PaymentSheetApplePay(
            merchantCountryCode: 'CL',
          ),
          googlePay: const PaymentSheetGooglePay(
            merchantCountryCode: 'CL',
            testEnv: true,
          ),
        ),
      );

      // await _confirmPaymentIntent(
      //   amount: amount,
      //   currency: currency,
      //   paymentMethod: paymentMethod,
      // );
      return StripeCustomResponse(
        success: true,
        message: '',
      );
    } catch (e) {
      return StripeCustomResponse(success: false, message: e.toString());
    }
  }

  Future payWithAppleGoogle({required String amount, required String currency}) async {}

  Future<void> _createPaymentIntent({required String amount, required String currency}) async {}

  // Future<String> retrievePaymentIntent(String paymentIntentId) async {}

  Future<void> _confirmPaymentIntent({
    required String amount,
    required String currency,
    required PaymentMethod paymentMethod,
  }) async {}

  void handleError(String error) {}
}
