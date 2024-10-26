import 'package:flutter/material.dart';

///
class OfferScreen extends StatelessWidget {
  ///
  const OfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            children: List.generate(
              100,
              (index) => Padding(
                padding: const EdgeInsets.all(8),
                child: Text('data$index'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
