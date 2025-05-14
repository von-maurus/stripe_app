import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stripe_app/bloc/pay/pay_bloc.dart';
import 'package:stripe_app/pages/home_page.dart';
import 'package:stripe_app/pages/payment_success_page.dart';
import 'package:stripe_app/services/stripe_service.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    StripeService().init();

    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => PayBloc())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Stripe App',
        routes: {
          'home': (_) => const HomePage(),
          'success_page': (_) => const PaymentSuccessPage(),
        },
        initialRoute: 'home',
        theme: ThemeData.light().copyWith(
          primaryColor: Color(0xFF284879),
          scaffoldBackgroundColor: Color(0xFF21232A),
        ),
      ),
    );
  }
}
