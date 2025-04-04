part of 'pay_bloc.dart';

@immutable
class PayState {
  final double amount;
  final String currency;
  final bool active;
  final CreditCardCustomModel? card;

  const PayState({
    this.amount = 375.99,
    this.currency = 'USD',
    this.active = false,
    this.card,
  });

  PayState copyWith({
    double? amount,
    String? currency,
    bool? active,
    CreditCardCustomModel? card,
  }) {
    return PayState(
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      active: active ?? this.active,
      card: card ?? this.card,
    );
  }
}
