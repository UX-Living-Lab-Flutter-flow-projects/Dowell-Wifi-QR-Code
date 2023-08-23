import '/components/wifi_tile_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HanyListViewModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // Model for WifiTile component.
  late WifiTileModel wifiTileModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    wifiTileModel = createModel(context, () => WifiTileModel());
  }

  void dispose() {
    wifiTileModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
