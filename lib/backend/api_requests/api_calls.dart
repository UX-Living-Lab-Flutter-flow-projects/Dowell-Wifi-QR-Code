import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class LinkBageLoginCall {
  static Future<ApiCallResponse> call({
    String? username = '',
    String? os = '',
    String? device = '',
    String? browser = 'Mobile App',
    String? location = '',
    String? time = '',
    String? connection = '',
    String? ip = '',
  }) {
    final body = '''
{
  "Username": "${username}",
  "OS": "${os}",
  "Device": "${device}",
  "Browser": "${browser}",
  "Location": "${location}",
  "Time": "${time}",
  "Connection": "${connection}",
  "IP": "${ip}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'link bage login ',
      apiUrl: 'https://100014.pythonanywhere.com/api/linkbased/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class SendQRCodeRequestCall {
  static Future<ApiCallResponse> call({
    String? ssid = '',
    String? password = '',
    String? function = '',
    String? security = '',
    String? logo = '',
    String? date = '',
    String? time = '',
    String? sessionId = '',
  }) {
    final body = '''
{
  "wifi_ssid": "${ssid}",
  "wifi_password": "${password}",
  "function": "${function}",
  "security": "${security}",
  "logo": "${logo}",
  "date": "${date}",
  "time": "${time}",
  "sessionId": "${sessionId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'sendQRCodeRequest',
      apiUrl: 'https://100073.pythonanywhere.com/wifi/test-qr/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class CreateRoomForDigitalQCall {
  static Future<ApiCallResponse> call({
    String? username = '',
    String? qrid = '',
    String? product = 'DigitalQ',
  }) {
    final body = '''
{
  "user_name": "${username}",
  "qrid": "${qrid}",
  "product": "${product}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'create room for digitalQ',
      apiUrl: 'http://100069.pythonanywhere.com/chat/create-room/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class TestQRCodeRequestCall {
  static Future<ApiCallResponse> call({
    String? wifiName = '',
    String? wifiPass = '',
    String? encryption = '',
    String? logo = '',
    String? userId = '',
    String? clientAdminId = '',
  }) {
    final body = '''
{
  "wifi_name": "${wifiName}",
  "wifi_password": "${wifiPass}",
  "encryption_type": "${encryption}",
  "logo": "${logo}",
  "userID": "${userId}",
  "client_admin_id": "${clientAdminId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'testQRCodeRequest',
      apiUrl: 'https://100073.pythonanywhere.com/wifi/create-qr-2/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class EmailSendQRCall {
  static Future<ApiCallResponse> call({
    String? name = '',
    String? email = '',
    String? qrCodeUrl = '',
    String? subject = '',
    String? content = '',
    String? id = '',
  }) {
    final body = '''
{
  "name": "${name}",
  "email": "${email}",
  "qrcode_url": "${qrCodeUrl}",
  "subject": "${subject}",
  "content": "${content}",
  "id": "${id}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'emailSendQR',
      apiUrl: 'https://100056.pythonanywhere.com/wifi/qr-email/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class DownloadQRAPICall {
  static Future<ApiCallResponse> call({
    String? url = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'downloadQRAPI',
      apiUrl: 'https://100073.pythonanywhere.com/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetReportsCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getReports',
      apiUrl: 'https://100073.pythonanywhere.com/wifi/fetchqrcode/',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'user_id': userId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic reportResponse(dynamic response) => getJsonField(
        response,
        r'''$.qr_code_details''',
      );
}

class FiveCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'five',
      apiUrl: 'www.google.com',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
