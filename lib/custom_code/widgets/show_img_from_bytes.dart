// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your widget name, define your parameter, and then add the

import 'dart:convert';

class ShowImgFromBytes extends StatefulWidget {
  const ShowImgFromBytes({
    Key? key,
    this.width,
    this.height,
    this.base64String,
  }) : super(key: key);
  final double? width;
  final double? height;
  final String? base64String;
  @override
  _ShowImgFromBytesState createState() => _ShowImgFromBytesState();
}

class _ShowImgFromBytesState extends State<ShowImgFromBytes> {
  late Uint8List bytes;
  @override
  void initState() {
    super.initState();
    bytes = base64Decode(widget.base64String ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 250,
      decoration: BoxDecoration(
        border: Border.all(width: 1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Image.memory(bytes, fit: BoxFit.contain),
    );
  }
}

// boilerplate code using the button on the right!
