import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';




class policyPrivacyButtom extends StatelessWidget {
  const policyPrivacyButtom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

  final Uri _url =
        Uri(scheme: 'https', host: 'www.google.com.br');

 Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

    return Container(
      margin: const EdgeInsets.only(bottom: 60,top: 20),
      child: TextButton(
        onPressed: (){
          _launchUrl(_url);
        },
          style:  ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.transparent),
            ),
        child: const Text(
          "Política e Privacidade",
          textAlign: TextAlign.center,
          style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w100,
                    fontSize: 16
                  ),
          ),
      ),
    );
  }
}