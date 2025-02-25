import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF141516),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 100),
            child: PaymentModeSelector(),
          ),
        ),
      ),
    );
  }
}

class PaymentModeSelector extends StatefulWidget {
  @override
  _PaymentModeSelectorState createState() => _PaymentModeSelectorState();
}

class _PaymentModeSelectorState extends State<PaymentModeSelector> {
  String _selectedMode = "pay"; // Default selected mode

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 20), // Align to left side
      child: Row(
        children: [
          _buildGlowingButton("pay"),
          SizedBox(width: 16), // Space between buttons
          _buildGlowingButton("card"),
        ],
      ),
    );
  }

  Widget _buildGlowingButton(String mode) {
    bool isSelected = _selectedMode == mode; // Check if the button is selected

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedMode = mode;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 40),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF121213),
              Color(0xFF121213),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: isSelected
                  ? const Color.fromARGB(255, 211, 8, 8).withOpacity(1) // Red glow when selected
                  : Colors.white.withOpacity(0.5), // White glow when not selected
              blurRadius: 4, // Small blur for a subtle glow effect
              offset: Offset(0, -3), // Offset to position the glow at the top
            ),
          ],
        ),
        child: Text(
          mode.toUpperCase(),
          style: TextStyle(
            color: Colors.white, // Keep text color white
            fontSize: 15,
            fontWeight: FontWeight.bold,
            fontFamily: 'SpaceGrotesk',
          ),
        ),
      ),
    );
  }
}
