import 'dart:developer';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:logging/logging.dart';

@RoutePage()
class PaymentCreditCardPage extends StatefulWidget {
  final String title;
  const PaymentCreditCardPage({super.key, this.title = "Payment Credit Card"});

  @override
  State<PaymentCreditCardPage> createState() => _PaymentCreditCardPageState();
}

@RoutePage()
class _PaymentCreditCardPageState extends State<PaymentCreditCardPage> {
  final Logger _logger = Logger('PaymentCreditCardPage');

  @override
  void initState() {
    super.initState();
    Logger.root.level = Level.ALL; // Set the root logger level
    Logger.root.onRecord.listen((record) {
      // You can customize the log output format here
      log('${record.level.name}: ${record.time}: ${record.message}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16),
        child: CardField(
          onCardChanged: (card) {
            _logger.info(card);
          },
        ),
      ),
    );
  }
}
