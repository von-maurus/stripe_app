part of 'pay_bloc.dart';

@immutable
sealed class PayEvent {}

class OnCardSelected extends PayEvent {
  final CreditCardCustomModel card;

  OnCardSelected(this.card);
}

class OnDeactivateCard extends PayEvent {}
