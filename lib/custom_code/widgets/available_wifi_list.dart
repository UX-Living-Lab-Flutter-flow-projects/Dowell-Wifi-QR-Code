// Automatic FlutterFlow imports
import 'dart:io';

import 'package:flutter/cupertino.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/services.dart';
import 'package:wifi_iot/wifi_iot.dart';
import 'package:wifi_scan/wifi_scan.dart';
import 'package:location/location.dart';

class AvailableWifiList extends StatefulWidget {
  const AvailableWifiList({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  State<AvailableWifiList> createState() => _AvailableWifiListState();
}

class _AvailableWifiListState extends State<AvailableWifiList> {
  late List<WifiModel> allAvailableWifiList = [];
  // late int selectedTile = 0;
  late String selectedTile = '';
  late String _ssid = '';

  /// this function is from wifi_iot ///
  Future<List<WifiNetwork>> loadAvailableWifiList() async {
    List<WifiNetwork> htResultNetwork;
    try {
      htResultNetwork = await WiFiForIoTPlugin.loadWifiList();
      for (var element in htResultNetwork) {
        print('all elements are ${element.ssid}');
        setState(() {
          allAvailableWifiList.add(WifiModel(
            ssid: element.ssid ?? '',
            bssid: element.bssid ?? '',
          ));
        });
      }
    } on PlatformException {
      htResultNetwork = <WifiNetwork>[];
    }

    return htResultNetwork;
  }

  /// this function is from wifi_scan  ///

  Future<void> requestLocationPermission() async {

    print('1');

    var location = Location();

    print('2');
    bool _serviceEnabled;
    PermissionStatus _permission;

    print('3');

    _serviceEnabled = await location.serviceEnabled();

    if (!_serviceEnabled) {
      print('4');
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        print('5');
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return _alert(context);
          },
        );

        return;
      }
    }

    _permission = await location.hasPermission();
    print('6');
    if (_permission == PermissionStatus.denied) {
      print('7');
      _permission = await location.requestPermission();
     // loadAvailableWifiList();
      if (_permission != PermissionStatus.granted) {
        print('8');
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return _alert(context);
          },
        );
        return;
      }else{
        print('9');
       await scanWifiNetworks();
      }
    }
  }


  Future<void> scanWifiNetworks() async {
    try {

      // if (Platform.isIOS) {
      //   await requestLocationPermission();
      // }
      //List<WifiNetwork> wifiNetworks = await WifiScan().getWifiList();
      List<WiFiAccessPoint> wifiNetworks = await WiFiScan.instance.getScannedResults();
      print('two $wifiNetworks');
      for (WiFiAccessPoint wifi in wifiNetworks) {
        print('SSID: ${wifi.ssid}, BSSID: ${wifi.bssid}, Signal Strength: ${wifi.level}');
        setState(() {
          allAvailableWifiList.add(WifiModel(
            ssid: wifi.ssid ?? '',
            bssid: wifi.bssid ?? '',
          ));
        });

      }
    } catch (e) {
      print('Error fetching Wi-Fi list: $e');
    }
  }

  Future<void> fetchWifiList() async {
    try{
      if(Platform.isIOS){
       await requestLocationPermission();
      // await scanWifiNetworks();
      }else{
       // scanWifiNetworks();
        loadAvailableWifiList();
      }
    }catch(e){
      print(e.toString());
    }
  }


  @override
  void initState() {
   // scanWifiNetworks();
    fetchWifiList();
    //loadAvailableWifiList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: allAvailableWifiList.length,
      separatorBuilder: (BuildContext context, int index) => const SizedBox(
        height: 8.0,
      ),
      itemBuilder: (BuildContext context, int index) {
        var _data = allAvailableWifiList[index];
        return WifiTileWidget(
            wifiName: _data.ssid,
            onTap: () {
              setState(() {
                selectedTile = index.toString();
                FFAppState().wifiName = _data.ssid;
              });
            },
            index: index,
            selectedTile: selectedTile);
      },
    );
  }

  Widget _alert(BuildContext context){
    return CupertinoAlertDialog(
      title: Text('Warning!'),
      content: Text("Enable the location service from the device settings"),
      actions: [
      TextButton(
            child: Text("OK"),
            onPressed: () {
              Navigator.pop(context);
              context.pushNamed('home');
            },
          )
      ],
    );
  }

}

class WifiModel {
  final String ssid;
  final String bssid;

  WifiModel({required this.ssid, required this.bssid});
}

class WifiTileWidget extends StatefulWidget {
  final String wifiName;
  final String selectedTile;
  final int index;
  final VoidCallback? onTap;

  const WifiTileWidget(
      {Key? key,
      required this.wifiName,
      this.onTap,
      required this.selectedTile,
      required this.index})
      : super(key: key);

  @override
  _WifiTileWidgetState createState() => _WifiTileWidgetState();
}

class _WifiTileWidgetState extends State<WifiTileWidget> {
  late bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.00),
      child: InkWell(
        onTap: widget.onTap,
        child: Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                blurRadius: 0,
                color: Color(0xFFE0E3E7),
                offset: Offset(0, 1),
              )
            ],
            borderRadius: BorderRadius.circular(20),
            shape: BoxShape.rectangle,
            border: Border.all(
              color: Color(0xFF2FD106),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(4, 9, 0, 9),
                  child: Container(
                    width: 3,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFF2FD106),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                    child: Text(
                      widget.wifiName,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize:
                              widget.selectedTile == widget.index.toString()
                                  ? 22
                                  : 20,
                          fontWeight:
                              widget.selectedTile == widget.index.toString()
                                  ? FontWeight.w600
                                  : FontWeight.w400),
                    ),
                  ),
                ),
                Theme(
                  data: ThemeData(
                    unselectedWidgetColor: Colors.black,
                  ),
                  child: Checkbox(
                    value: widget.selectedTile == widget.index.toString()
                        ? true
                        : false,
                    onChanged: (newValue) async {},
                    activeColor: Color(0xFF2FD106),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
