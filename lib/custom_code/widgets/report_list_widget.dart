// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your widget name, define your parameter, and then add the
// boilerplate code using the button on the right!

import 'dart:convert';
import 'package:dio/dio.dart';

class ReportListWidget extends StatefulWidget {
  final double? height;
  final double? width;
  const ReportListWidget({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  State<ReportListWidget> createState() => _ReportListWidgetState();
}

class _ReportListWidgetState extends State<ReportListWidget> {
  late List<Report> reportList = [];

  Future<Map<String, dynamic>?> getReportList() async {
    try {
      var userId = '641881ef568bb456502542ec';
      BaseOptions options =
          BaseOptions(baseUrl: 'https://100073.pythonanywhere.com');
      var dio = Dio(options);

      var response = await dio.get('/wifi/fetchqrcode/?user_id=$userId');

      if (response.data['success'] == true) {
        var reports = jsonDecode(response.data['qr_code_details']);
        reports['data'].forEach((e) {
          setState(() {
            reportList.add(Report(
                e['wifi_qr_image'] ?? '',
                e['wifi_ssid'] ?? 'Empty Wifi Name',
                e['_id'] ?? 'Empty id',
                e['wifi_password'] ?? 'Empty password'));
          });
        });
      }
      return {'status': 'success', 'data': response.data};
    } on DioError catch (e) {
      return null;
    }
  }

  @override
  void initState() {
    getReportList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return reportList.isEmpty
        ? const Center(
            child: Text(
            'You have no report',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ))
        : ListView.separated(
            shrinkWrap: true,
            itemCount: reportList.length,
            separatorBuilder: (context, index) => const SizedBox(
                  height: 16.0,
                ),
            itemBuilder: (context, index) {
              var _data = reportList[index];
              return ReportTile(
                  imageUrl: _data.imageUrl,
                  wifiName: _data.wifiName,
                  id: _data.id,
                  password: _data.password);
            });
  }
}

class Report {
  final String imageUrl;
  final String wifiName;
  final String id;
  final String password;

  Report(this.imageUrl, this.wifiName, this.id, this.password);
}

class ReportTile extends StatelessWidget {
  final String imageUrl;
  final String wifiName;
  final String id;
  final String password;

  const ReportTile(
      {Key? key,
      required this.imageUrl,
      required this.wifiName,
      required this.id,
      required this.password})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Image.network(
            imageUrl,
            //'https://img.freepik.com/free-photo/closeup-shot-purple-flower_181624-25863.jpg?w=1800&t=st=1692084452~exp=1692085052~hmac=0506397961300334251ec69617d55cb9feba21faa1bb6b32427118d373d133ed',
            height: 80,
            width: 90,
          ),
          const SizedBox(
            width: 16.0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                wifiName,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              Text(
                id,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              Text(
                password,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
