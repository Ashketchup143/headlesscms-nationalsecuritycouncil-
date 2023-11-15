import 'package:flutter/material.dart';
import 'package:nscheadlesscms/components/topbarbutton.dart';
import 'package:url_launcher/url_launcher.dart';

class topBarContents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: .0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(flex: 1, child: SizedBox()),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    _launchURL('https://www.gov.ph/');
                  },
                  child: Text(
                    "GOVPH",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                topBarButton(" Home "),
                topBarButton(" National Security Policy "),
                topBarButton(" Transparency "),
                topBarButton(" Service Charter "),
                topBarButton(" FOI Manual "),
                topBarButton(" SALN Submission "),
                topBarButton(" MARC "),
                topBarButton(" Help Desk "),
                topBarButton(" PBB-Related "),
              ],
            ),
            Expanded(flex: 1, child: SizedBox()),
          ],
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
