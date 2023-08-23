// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_email_sender/flutter_email_sender.dart';

Future<void> emailQRCode(String? imageUrl) async {
  // Add your function code here!

  final Email email = Email(
    body: 'Hi, get the wifi qr code from the given link $imageUrl',
    subject: 'Wifi QR Code',
    recipients: ['example@example.com'],
    cc: ['cc@example.com'],
    bcc: ['bcc@example.com'],
    attachmentPaths: ['/path/to/attachment.zip'],
    isHTML: true,
  );

  await FlutterEmailSender.send(email);
}
