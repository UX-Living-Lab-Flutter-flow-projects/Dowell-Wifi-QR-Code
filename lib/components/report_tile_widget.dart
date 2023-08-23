import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'report_tile_model.dart';
export 'report_tile_model.dart';

class ReportTileWidget extends StatefulWidget {
  const ReportTileWidget({
    Key? key,
    required this.wifiName,
    required this.id,
    required this.password,
  }) : super(key: key);

  final String? wifiName;
  final String? id;
  final String? password;

  @override
  _ReportTileWidgetState createState() => _ReportTileWidgetState();
}

class _ReportTileWidgetState extends State<ReportTileWidget> {
  late ReportTileModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReportTileModel());

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

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              'assets/images/Frame_48.png',
              width: 90.0,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          width: 201.0,
          height: 100.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FutureBuilder<ApiCallResponse>(
                  future: GetReportsCall.call(
                    userId: getJsonField(
                      FFAppState().response,
                      r'''$.userinfo.userID''',
                    ).toString(),
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Color(0xFF6AC36A),
                            ),
                          ),
                        ),
                      );
                    }
                    final textGetReportsResponse = snapshot.data!;
                    return Text(
                      FFLocalizations.of(context).getText(
                        'mwcl2100' /* Wifi Name  */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    );
                  },
                ),
                Text(
                  FFLocalizations.of(context).getText(
                    '6w6cnyq2' /* Id  */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
                Text(
                  FFLocalizations.of(context).getText(
                    'widzimne' /* password */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
