import '/components/wifi_tile_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'hany_list_view_model.dart';
export 'hany_list_view_model.dart';

class HanyListViewWidget extends StatefulWidget {
  const HanyListViewWidget({Key? key}) : super(key: key);

  @override
  _HanyListViewWidgetState createState() => _HanyListViewWidgetState();
}

class _HanyListViewWidgetState extends State<HanyListViewWidget> {
  late HanyListViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HanyListViewModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return ListView(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      children: [
        wrapWithModel(
          model: _model.wifiTileModel,
          updateCallback: () => setState(() {}),
          child: WifiTileWidget(),
        ),
      ],
    );
  }
}
