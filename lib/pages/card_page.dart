import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:stripe_app/bloc/pay/pay_bloc.dart';
import 'package:stripe_app/models/credit_card_custom_model.dart';
import 'package:stripe_app/widgets/payment_detail_widget.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key, required this.card});
  final CreditCardCustomModel card;
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<PayBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagar'),
        leading: IconButton(
          icon: Icon(Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios),
          onPressed: () {
            bloc.add(OnDeactivateCard());
            Navigator.pop(context);
          },
        ),
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
