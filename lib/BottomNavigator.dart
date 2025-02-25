import 'package:flutter/material.dart';

class BottomNavigator extends StatefulWidget {
  @override
  _BottomNavigatorState createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  int _selectedIndex = 1; // Default selected index

  final List<Map<String, dynamic>> _navItems = [
    {'icon': Icons.home_outlined, 'label': 'Home'},
    {'icon': Icons.qr_code_scanner, 'label': 'Yolo Pay'}, // Middle button
    {'icon': Icons.percent, 'label': 'Ginie'},
  ];

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 150, // Adjusted height
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Frame.png'), // Background image
            fit: BoxFit.cover, // Cover the entire background
          ),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(_navItems.length, (index) {
                bool isSelected = _selectedIndex == index;
                bool isMiddle = index == 1; // Middle button

                return GestureDetector(
                  onTap: () => setState(() => _selectedIndex = index),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: isMiddle ? 60 : 45, // Smaller circle for icons
                        width: isMiddle ? 60 : 45,
                        margin: EdgeInsets.only(bottom: isMiddle ? 10 : 0, left: isMiddle ? 0 : 45, right: isMiddle ? 0 : 45),
                        decoration: BoxDecoration(
                          color: Color(0xFF1a1a1a),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: isSelected
                                  ? Colors.red.withOpacity(0.8) // Red glow when selected
                                  : Colors.white.withOpacity(0.5), // White glow when not selected
                              blurRadius: 5,
                              spreadRadius: 1,
                              offset: Offset(0, -2), // Light effect at top
                            ),
                          ],
                        ),
                        child: Icon(
                          _navItems[index]['icon'],
                          color: isSelected ? Colors.red : Colors.white,
                          size: isMiddle ? 30 : 24, // Adjusted icon size
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        _navItems[index]['label'],
                        style: TextStyle(
                          color: isSelected ? const Color.fromARGB(255, 255, 255, 255) : Colors.white,
                          fontSize: 10, // Adjusted font size
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
