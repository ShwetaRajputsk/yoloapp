import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cardmodel.dart';
import 'paymentmodeselector.dart';
import 'digitalcard.dart';
import 'bottomnavigator.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView( // Add this
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'select payment mode',
                  style: Theme.of(context).textTheme.titleLarge, // Updated text style
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'choose your preferred payment method to make payment.',
                  style: Theme.of(context).textTheme.titleMedium, // Updated text style
                ),
              ),
              SizedBox(height: 20),
              PaymentModeSelector(),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'YOUR DIGITAL DEBIT CARD',
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                ),
              ),
              SizedBox(height: 10),
              DigitalCard(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigator(),
    );
  }
}