import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'customization_model.dart';
export 'customization_model.dart';

class CustomizationWidget extends StatefulWidget {
  const CustomizationWidget({Key? key}) : super(key: key);

  @override
  _CustomizationWidgetState createState() => _CustomizationWidgetState();
}

class _CustomizationWidgetState extends State<CustomizationWidget> {
  late CustomizationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CustomizationModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Title(
        title: 'customization',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: Color(0xFFBFF5A7),
              automaticallyImplyLeading: true,
              title: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'oltjv9mc' /* Customization */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        color: Color(0xFF344F30),
                        fontSize: 15.0,
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.asset(
                            'assets/images/Rectangle_1.png',
                          ).image,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 342.0,
                            child: Divider(
                              thickness: 2.0,
                              color: Color(0xFF004F20),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 30.0, 0.0, 10.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'rfwr2bop' /* Your Logo */,
                              ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: Color(0xFF344F30),
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.sizeOf(context).width * 0.5,
                            height: MediaQuery.sizeOf(context).height * 0.2,
                            child: custom_widgets.ShowImgFromBytes(
                              width: MediaQuery.sizeOf(context).width * 0.5,
                              height: MediaQuery.sizeOf(context).height * 0.2,
                              base64String: valueOrDefault<String>(
                                FFAppState().logoPath,
                                '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',
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 30.0, 20.0, 15.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                if (FFAppState().sessionId == null ||
                                    FFAppState().sessionId == '') {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Please login first to upload image!',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                    ),
                                  );
                                } else {
                                  await actions.pickImageFromGallery();

                                  context.pushNamed('customizationCopy');
                                }
                              },
                              child: Container(
                                width: 348.1,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFBFF5A7),
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                    color: Color(0xFF227121),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      _model.base64 =
                                          await actions.pickImageFromGallery();

                                      context.pushNamed('customizationCopy');

                                      setState(() {});
                                    },
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'cu5zu14k' /* Update Logo */,
                                      ),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: Color(0xFF227121),
                                            fontSize: 11.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          FFButtonWidget(
                            onPressed: () async {
                              _model.apiResultwza =
                                  await TestQRCodeRequestCall.call(
                                wifiName: FFAppState().wifiName,
                                wifiPass: FFAppState().password,
                                encryption: FFAppState().encryption,
                                logo: FFAppState().logoPath,
                                userId: getJsonField(
                                  FFAppState().response,
                                  r'''$.userinfo.userID''',
                                ).toString(),
                                clientAdminId: getJsonField(
                                  FFAppState().response,
                                  r'''$.userinfo.client_admin_id''',
                                ).toString(),
                              );
                              if ((_model.apiResultwza?.succeeded ?? true)) {
                                context.pushNamed(
                                  'QR_code',
                                  queryParameters: {
                                    'qrCodeUrl': serializeParam(
                                      getJsonField(
                                        (_model.apiResultwza?.jsonBody ?? ''),
                                        r'''$.returned_data.qrcode_image''',
                                      ).toString(),
                                      ParamType.String,
                                    ),
                                    'downloadUrl': serializeParam(
                                      getJsonField(
                                        (_model.apiResultwza?.jsonBody ?? ''),
                                        r'''$.returned_data.download_url''',
                                      ).toString(),
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Please enter the correct password.',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).secondary,
                                  ),
                                );
                              }

                              setState(() {});
                            },
                            text: FFLocalizations.of(context).getText(
                              'qymvb0te' /* Skip */,
                            ),
                            options: FFButtonOptions(
                              width: 80.0,
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Color(0x003A5434),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Inter',
                                    color: Colors.black,
                                    fontSize: 11.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
