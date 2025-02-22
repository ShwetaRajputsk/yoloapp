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
                    "assets/card_background.jpg",
                    fit: BoxFit.cover,
                  ),
                ),

                // Frosted Glass Blur Effect
                BackdropFilter(
                  filter: ImageFilter.blur(
                      sigmaX: isFrozen ? 20 : 6, sigmaY: isFrozen ? 20 : 6),
                  child: AnimatedOpacity(
                    duration: Duration(milliseconds: 300),
                    opacity: isFrozen ? 0.3 : 1.0,
                    child: Container(
                      width: 250,
                      height: 380,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white.withOpacity(0.07),
                        border: Border.all(color: Colors.white.withOpacity(0.15)),
                      ),
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Logos
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset("assets/yolo.svg", height: 26),
                              Image.asset("assets/yesbank.png", height: 60),
                            ],
                          ),
                          SizedBox(height: 30),

                          // Card Details
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildCardText("8124"),
                                  _buildCardText("4212"),
                                  _buildCardText("3456"),
                                  _buildCardText("7890"),
                                ],
                              ),
                              Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text("Expiry",
                                      style:
                                          TextStyle(color: Colors.grey, fontSize: 12)),
                                  _buildCardText("01/28"),
                                  SizedBox(height: 14),
                                  Text("CVV",
                                      style:
                                          TextStyle(color: Colors.grey, fontSize: 12)),
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
                                          showCVV
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                          color: Colors.redAccent,
                                          size: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Spacer(),

                          // Footer
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton.icon(
                                onPressed: () {},
                                icon: Icon(Icons.copy, color: Colors.redAccent, size: 16),
                                label: Text("Copy Details",
                                    style: TextStyle(color: Colors.redAccent, fontSize: 12)),
                              ),
                              Image.asset("assets/rupay.png", height: 35),
                            ],
                          ),
                        ],
                      ),
                    ),
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
                print("Button Pressed: isFrozen = $isFrozen"); // Debugging print
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
                        color: isFrozen ? Colors.red : Colors.white,
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
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.6),
              borderRadius: BorderRadius.circular(4),
            ),
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
