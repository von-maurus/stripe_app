import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:stripe_app/models/credit_card_custom_model.dart';
import 'package:stripe_app/widgets/payment_detail_widget.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key, required this.card});
  final CreditCardCustomModel card;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagar'),
      ),
      body: Stack(
        children: [
          Container(),
          Hero(
            tag: card.cardNumber,
            child: CreditCardWidget(
              showBackView: false,
              cardNumber: card.cardNumber,
              expiryDate: card.expiracyDate,
              cardHolderName: card.cardHolderName,
              cvvCode: card.cvv,
              onCreditCardWidgetChange: (card) {},
            ),
          ),
          Positioned(
            bottom: 0,
            child: PaymentDetailWidget(),
          )
        ],
      ),
    );
  }
}
