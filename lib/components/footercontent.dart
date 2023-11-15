import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Image.asset(
              'assets/transparencyseal.png',
              height: 100,
            ),
          ),
          SizedBox(width: 10),
          // 1st Column
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildFooterTitle(
                  'REPUBLIC OF THE PHILIPPINES',
                  'https://nsc.gov.ph/',
                ),
                SizedBox(height: 8.0),
                _buildFooterContent(
                  'All content is in the public domain unless otherwise stated.',
                  'https://nsc.gov.ph/',
                ),
              ],
            ),
          ),
          SizedBox(width: 10),
          // 2nd Column
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildFooterTitle(
                  'ABOUT GOVPH',
                  'https://nsc.gov.ph/',
                ),
                _buildFooterContent(
                  'Learn more about the Philippine government, its structure, \n how government works, and the people behind it.',
                  'https://nsc.gov.ph/',
                ),
                SizedBox(height: 8.0),
                _buildFooterTitle(
                  'GOV.PH',
                  'https://nsc.gov.ph/',
                ),
                _buildFooterContent('Open Data Portal', 'https://nsc.gov.ph/'),
                _buildFooterContent('Official Gazette', 'https://nsc.gov.ph/'),
              ],
            ),
          ),
          SizedBox(width: 20),
          // 3rd Column
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildFooterTitle(
                  'GOVERNMENT LINKS',
                  'https://nsc.gov.ph/',
                ),
                _buildFooterContent(
                    'Office of the President', 'https://nsc.gov.ph/'),
                _buildFooterContent(
                    'Office of the Vice President', 'https://nsc.gov.ph/'),
                _buildFooterContent(
                    'Senate of the Philippines', 'https://nsc.gov.ph/'),
                _buildFooterContent(
                    'House of Representatives', 'https://nsc.gov.ph/'),
                _buildFooterContent('Supreme Court', 'https://nsc.gov.ph/'),
                _buildFooterContent('Court of Appeals', 'https://nsc.gov.ph/'),
                _buildFooterContent('Sandiganbayan', 'https://nsc.gov.ph/'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  GestureDetector _buildFooterContent(String text, String url) {
    return GestureDetector(
      onTap: () {
        _launchURL(url);
      },
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 12.0),
      ),
    );
  }

  Widget _buildFooterTitle(String text, String url) {
    return GestureDetector(
      onTap: () {
        _launchURL(url);
      },
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
