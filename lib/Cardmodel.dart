import 'package:flutter/foundation.dart';
import 'package:faker/faker.dart';

class CardModel extends ChangeNotifier {
  final faker = Faker();
  late String cardNumber;
  late String expiryDate;
  late String cvv;
  bool isFrozen = false;

  CardModel() {
    _generateCardDetails();
  }

  void _generateCardDetails() {
    // Generate a valid card number
    cardNumber = _generateFakeCardNumber();

    // Generate a valid expiry date in MM/YY format
    int month = faker.randomGenerator.integer(12, min: 1); // Random month between 1 and 12
    int year = faker.randomGenerator.integer(99, min: 23); // Random year between 23 and 99 (for 2023 to 2099)

    expiryDate = '${month.toString().padLeft(2, '0')}/$year';

    // Generate a valid CVV
    cvv = _generateFakeCVV();
  }

  // Helper method to generate a fake card number
  String _generateFakeCardNumber() {
    return faker.randomGenerator.numbers(16, 9).join();
  }

  // Helper method to generate a fake CVV
  String _generateFakeCVV() {
    return faker.randomGenerator.numbers(3, 9).join();
  }

  void toggleFreeze() {
    isFrozen = !isFrozen;
    notifyListeners();
  }
}