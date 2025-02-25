import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DigitalCard extends StatefulWidget {
  @override
  _DigitalCardState createState() => _DigitalCardState();
}

class _DigitalCardState extends State<DigitalCard> {
  bool showCVV = false;
  bool isFrozen = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Card UI
        Align(
          alignment: Alignment(-0.8, 0.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                // Background Image
                Positioned.fill(
                  child: Image.asset(
                    isFrozen ? "assets/freezecard.png" : "assets/card.png", // Change image based on freeze state
                    fit: BoxFit.cover,
                  ),
                ),
                // Card Details
                Container(
                  width: 250,
                  height: 380,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white.withOpacity(0.15)), // Keep border if needed
                  ),
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 60),

                      // Card Details
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10), // Moves the column 10 pixels to the right
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildCardText("8124"),
                                _buildCardText("4212"),
                                _buildCardText("3456"),
                                _buildCardText("7890"),
                              ],
                            ),
                          ),
                          Spacer(),
                          if (!isFrozen) ...[
  Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Text("Expiry", style: TextStyle(color: Colors.grey, fontSize: 12)),
      _buildCardText("01/28"),
      SizedBox(height: 14),
      Text("CVV", style: TextStyle(color: Colors.grey, fontSize: 12)),
      Row(
        children: [
          _buildCardText(showCVV ? "123" : "***"),
          SizedBox(width: 6),
          GestureDetector(
            onTap: () {
              setState(() {
                showCVV = !showCVV;
              });
            },
            child: Icon(
              showCVV ? Icons.visibility_off : Icons.visibility,
              color: Colors.redAccent,
              size: 18,
            ),
          ),
        ],
      ),
    ],
  ),
],

                        ],
                      ),
                      // Footer
                      if (!isFrozen) ...[
  Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.only(left: 0, top: 15),
        child: TextButton.icon(
          onPressed: () {},
          icon: Icon(Icons.copy, color: Colors.redAccent, size: 16),
          label: Text(
            "Copy Details",
            style: TextStyle(color: Colors.redAccent, fontSize: 12),
          ),
        ),
      ),
    ],
  ),
],

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        // Freeze/Unfreeze Button
        Positioned(
          left: 300, // Adjust as needed
          top: 160, // Adjust as needed
          child: GestureDetector(
            onTap: () {
              setState(() {
                isFrozen = !isFrozen;
              });
            },
            child: Material(
              color: Colors.transparent,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        isFrozen = !isFrozen;
                      });
                    },
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[900],
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: isFrozen
                                ? const Color.fromARGB(255, 211, 8, 8).withOpacity(1) // Red glow when frozen
                                : Colors.white.withOpacity(1), // White glow when not frozen
                            blurRadius: 2, // Soft glow
                            spreadRadius: 0,
                            offset: Offset(0, -1), // Positioned at the top
                          ),
                          BoxShadow(
                            color: Colors.black.withOpacity(0.4),
                            blurRadius: 10,
                            spreadRadius: 2,
                            offset: Offset(4, 4),
                          ),
                          BoxShadow(
                            color: Colors.white.withOpacity(0.1),
                            blurRadius: 10,
                            spreadRadius: 2,
                            offset: Offset(-4, -4),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.all(18),
                      child: Icon(
                        Icons.ac_unit,
                        color: isFrozen ? const Color.fromARGB(255, 211, 8, 8) : Colors.white,
                        size: 28,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    isFrozen ? "Unfreeze" : "Freeze",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Helper function for text styling
  Widget _buildCardText(String text) {
    return isFrozen
        ? Container(
            width: 40,
            height: 18,
            // decoration: BoxDecoration(
            //   color: Colors.grey.withOpacity(0.6),
            //   borderRadius: BorderRadius.circular(4),
            // ),
          )
        : Text(
            text,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          );
  }
}
