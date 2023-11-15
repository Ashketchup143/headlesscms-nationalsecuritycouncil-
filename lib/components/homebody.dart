import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'footercontent.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 100.0, // Adjust the left padding as needed.
        right: 100.0, // Adjust the right padding as needed.
        top: 50.0, // Adjust the top padding as needed.
        bottom: 50.0, // Adjust the bottom padding as needed.
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8.0),
          Text(
            'NATIONAL SECURITY COUNCIL',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0d4e86),
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            'The National Security Council (NSC) is the principal advisory body on the proper coordination and integration of plans and policies affecting national security.',
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 16.0),
          Text(
            'The NSC consists of two distinct bodies - the Council Proper and the National Security Council Secretariat.',
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 16.0),
          Text(
            'The Council Proper is a collegial body chaired by the President. It includes concerned officials of the Cabinet and Congress, as members, as well as other government officials and private citizens who may be invited by the President.',
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 16.0),
          Text(
            'The Council was created during the Quirino Administration through Executive Order (EO) No. 330, dated 01 July 1950. It was reorganized by virtue of EO No. 115, series of 1986.',
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 16.0),
          Text(
            'The NSC Secretariat is a permanent body that provides technical support to the Council Proper. It is headed by the Director General / National Security Adviser.',
            style: TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}
