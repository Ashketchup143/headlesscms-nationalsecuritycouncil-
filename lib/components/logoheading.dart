import 'package:flutter/material.dart';

class LogoHead extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 235, 244, 252),
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(flex: 1, child: Container()),
          Expanded(
            flex: 8,
            child: Row(
              children: [
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/nscfulllogo.png',
                      height: 100,
                    )),
                SizedBox(width: 8.0),
              ],
            ),
          ),
          Expanded(flex: 1, child: Container()),
        ],
      ),
    );
  }
}
