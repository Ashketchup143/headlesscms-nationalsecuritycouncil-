import 'package:flutter/material.dart';

class PageHead extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      width: MediaQuery.of(context).size.width,
      height: 125,
      color: Color.fromARGB(255, 6, 84, 148),
      child: Row(
        children: [
          Expanded(flex: 1, child: Container()),
          Expanded(
            flex: 8,
            child: Text(
              'HOME',
              style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(flex: 1, child: Container()),
        ],
      ),
    );
  }
}
