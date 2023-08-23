// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'package:image_picker/image_picker.dart';

String _base64Image = '';

Future<String> pickImageFromGallery() async {
  //final pickedImage = await ImagePicker().getImage(source: ImageSource.gallery);
  final dynamic pickedImage =
      await ImagePicker().pickImage(source: ImageSource.gallery);

  if (pickedImage != null) {
    final imageBytes = await pickedImage.readAsBytes();

    _base64Image = base64Encode(imageBytes);
  }
  FFAppState().logoPath = _base64Image;
  return _base64Image;
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
