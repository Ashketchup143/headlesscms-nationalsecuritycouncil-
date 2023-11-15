import 'package:flutter/material.dart';

Widget topBarButton(String buttonText) {
  return Container(
    height: 60,
    padding: EdgeInsets.symmetric(horizontal: 20.0),
    decoration: BoxDecoration(
      border: Border.all(
        color: Color.fromARGB(255, 136, 136, 136), // Border color
        width: 0.2, // Border width
      ),
    ),
    child: TextButton(
      onPressed: () {
        // Handle button tap
      },
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.hovered)) {
              return Colors.grey.shade300; // Hover color
            }
            return Colors.transparent; // Use the default overlay color
          },
        ),
      ),
      child: Text(
        buttonText,
        style: TextStyle(
          color: Colors.black,
          fontSize: 16.0,
        ),
      ),
    ),
  );
}
