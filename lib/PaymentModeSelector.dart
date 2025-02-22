import 'package:flutter/material.dart';

class PaymentModeSelector extends StatefulWidget {
  @override
  _PaymentModeSelectorState createState() => _PaymentModeSelectorState();
}

class _PaymentModeSelectorState extends State<PaymentModeSelector> {
  String _selectedMode = "pay"; // Default selected mode

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 20), // Aligned to left side
      child: Row(
        children: [
          _buildNeumorphicButton("pay"),
          SizedBox(width: 12), // Space between buttons
          _buildNeumorphicButton("card"),
        ],
      ),
    );
  }

  Widget _buildNeumorphicButton(String mode) {
    bool isSelected = _selectedMode == mode;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedMode = mode;
        });
      },
      child: Container(
        width: 120, // Adjust width for better visibility
        height: 50,
        decoration: BoxDecoration(
          color: Color(0xFF1a1a1a),
          borderRadius: BorderRadius.circular(30), // Completely curved edges
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              offset: Offset(4, 4),
              blurRadius: 8,
            ),
            BoxShadow(
              color: Colors.white.withOpacity(0.1),
              offset: Offset(-4, -4),
              blurRadius: 8,
            ),
          ],
          border: isSelected ? Border.all(color: mode == "card" ? Colors.red : Colors.white, width: 1.5) : null,
        ),
        child: Center(
          child: Text(
            mode.toUpperCase(),
            style: TextStyle(
              color: isSelected ? (mode == "card" ? Colors.red : Colors.white) : Colors.grey.shade500,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
