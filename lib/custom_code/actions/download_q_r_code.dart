// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:url_launcher/url_launcher.dart';

Future<void> downloadQRCode(String? url) async {
  // Add your function code here!
  final Uri _url = Uri.parse("https://100073.pythonanywhere.com/$url");

  if (await launchUrl(_url)) {
    await launchUrl(_url);
  } else {
    throw Exception('Could not launch $_url this url');
  }
}
