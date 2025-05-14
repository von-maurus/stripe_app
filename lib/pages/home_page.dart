import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stripe_app/bloc/pay/pay_bloc.dart';
import 'package:stripe_app/data/cards_custom_data.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:stripe_app/helpers/helpers.dart';
import 'package:stripe_app/pages/card_page.dart';
import 'package:stripe_app/widgets/payment_detail_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagar'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () async {
              showLoader(context);
              await Future.delayed(Duration(seconds: 1));
              if (context.mounted) Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            width: size.width,
            height: size.height,
            top: (size.height - 400) / 2,
            child: PageView.builder(
              controller: PageController(viewportFraction: 0.8),
              physics: BouncingScrollPhysics(),
              itemCount: tarjetas.length,
              itemBuilder: (context, index) {
                final card = tarjetas[index];

                return GestureDetector(
                  onTap: () {
                    final payBloc = context.read<PayBloc>();
                    payBloc.add(OnCardSelected(card));
                    Navigator.push(context, navFadeIn(context, CardPage(card: card)));
                  },
                  child: Hero(
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
                );
              },
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
