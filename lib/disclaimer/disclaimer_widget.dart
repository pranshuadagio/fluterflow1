import '../chooseyour_challenge/chooseyour_challenge_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DisclaimerWidget extends StatefulWidget {
  const DisclaimerWidget({Key key}) : super(key: key);

  @override
  _DisclaimerWidgetState createState() => _DisclaimerWidgetState();
}

class _DisclaimerWidgetState extends State<DisclaimerWidget> {
  bool switchListTileValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF4B39EF),
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () async {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.chevron_left_rounded,
            color: Colors.white,
            size: 32,
          ),
        ),
        title: Text(
          'Disclaimer',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Lexend Deca',
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: Color(0xFF4B39EF),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 1,
        decoration: BoxDecoration(
          color: Color(0xFF4B39EF),
          image: DecorationImage(
            fit: BoxFit.fitWidth,
            image: Image.asset(
              'assets/images/wavesMiddle@3x.png',
            ).image,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 10),
                child: Text(
                  'AdagioVR is a very powerful tool that has strong effect on the connection of memory & emotions. This product is exclusively meant for subclinical users and under NO circumstances must be used by anyone with a clinical diagnosis or equally serious situation. Every effort has been made to accurately represent the usage & risks of the product and the value it provides. While we take all precautions to ensure that this tool does not reach any such users, AdagioVR assumes no responsibility for any harm that may come from the improper use of this tool by you or anyone you provide access to.\n\nAdagioVR assumes no responsibility for errors or omissions in the contents of the Service.\nIn no event shall the Company be liable for any special, direct, indirect, consequential, or incidental damages or any damages whatsoever, whether in an action of contract, negligence or other tort, arising out of or in connection with the use of the Service or the contents of the Service. The Company reserves the right to make additions, deletions, or modifications to the contents on the Service at any time without prior notice.\nThe Company does not warrant that the Service is free of viruses or other harmful components. ',
                  style: FlutterFlowTheme.of(context).bodyText2.override(
                        fontFamily: 'Lexend Deca',
                        color: FlutterFlowTheme.of(context).background,
                      ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
              child: SwitchListTile.adaptive(
                value: switchListTileValue ??= false,
                onChanged: (newValue) =>
                    setState(() => switchListTileValue = newValue),
                title: Text(
                  'I have read & understood the above information.',
                  textAlign: TextAlign.start,
                  style: FlutterFlowTheme.of(context).title3.override(
                        fontFamily: 'Lexend Deca',
                        color: FlutterFlowTheme.of(context).tertiaryColor,
                        fontSize: 15,
                      ),
                ),
                tileColor: FlutterFlowTheme.of(context).dark600,
                dense: false,
                controlAffinity: ListTileControlAffinity.trailing,
              ),
            ),
            if ((switchListTileValue) != (!(switchListTileValue)))
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 40),
                child: FFButtonWidget(
                  onPressed: () async {
                    if (switchListTileValue) {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChooseyourChallengeWidget(),
                        ),
                      );
                    } else {
                      return;
                    }
                  },
                  text: 'Continue',
                  options: FFButtonOptions(
                    width: 270,
                    height: 50,
                    color: FlutterFlowTheme.of(context).dark600,
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Lexend Deca',
                          color: FlutterFlowTheme.of(context).secondaryColor,
                        ),
                    elevation: 2,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: 8,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
