// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:wifi_iot/wifi_iot.dart';

Future<bool> connectToWifi(
  String wifiName,
  String password,
  String encryption,
) async {
  try {
    late NetworkSecurity security = NetworkSecurity.NONE;
    switch (encryption) {
      case 'WPA/WPA2':
        security = NetworkSecurity.WPA;
        break;
      case 'WEP':
        security = NetworkSecurity.WEP;
        break;
    }
    await WiFiForIoTPlugin.connect(wifiName,
        password: password, joinOnce: true, security: security);

    //await WifiIot.connect(ssid, password);
    print('Connected to $wifiName');
    return true;
  } catch (e) {
    print('Error connecting to $wifiName: $e');
    return false;
  }
}
