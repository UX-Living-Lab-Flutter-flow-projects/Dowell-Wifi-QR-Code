import 'package:flutter/material.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _sessionId = prefs.getString('ff_sessionId') ?? _sessionId;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _password = '';
  String get password => _password;
  set password(String _value) {
    _password = _value;
  }

  String _encryption = '';
  String get encryption => _encryption;
  set encryption(String _value) {
    _encryption = _value;
  }

  String _wifiName = '';
  String get wifiName => _wifiName;
  set wifiName(String _value) {
    _wifiName = _value;
  }

  String _qrCode = '';
  String get qrCode => _qrCode;
  set qrCode(String _value) {
    _qrCode = _value;
  }

  String _logoPath = '';
  String get logoPath => _logoPath;
  set logoPath(String _value) {
    _logoPath = _value;
  }

  dynamic _response;
  dynamic get response => _response;
  set response(dynamic _value) {
    _response = _value;
  }

  String _sessionId = '';
  String get sessionId => _sessionId;
  set sessionId(String _value) {
    _sessionId = _value;
    prefs.setString('ff_sessionId', _value);
  }

  String _completeDownloadUrl = '';
  String get completeDownloadUrl => _completeDownloadUrl;
  set completeDownloadUrl(String _value) {
    _completeDownloadUrl = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
