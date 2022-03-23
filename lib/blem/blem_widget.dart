import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_video_player.dart';
import '../main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BlemWidget extends StatefulWidget {
  const BlemWidget({Key key}) : super(key: key);

  @override
  _BlemWidgetState createState() => _BlemWidgetState();
}

class _BlemWidgetState extends State<BlemWidget> with TickerProviderStateMixin {
  final animationsMap = {
    'textOnPageLoadAnimation1': AnimationInfo(
      curve: Curves.easeIn,
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'textOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 820,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
  };
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back,
            color: FlutterFlowTheme.of(context).background,
            size: 30,
          ),
          onPressed: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NavBarPage(initialPage: 'Dashboard'),
              ),
            );
          },
        ),
        title: Text(
          'The Dreamer by AdagioVR',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Lexend Deca',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      backgroundColor: FlutterFlowTheme.of(context).dark600,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: [
              Image.asset(
                'assets/images/loading_screen.png',
                width: 1000,
                height: 2000,
                fit: BoxFit.fill,
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  FlutterFlowVideoPlayer(
                    path:
                        'https://firebasestorage.googleapis.com/v0/b/adagiovr-b9d3c.appspot.com/o/The%20Dreamer%20by%20AdagioVR%20VR%20split.mp4?alt=media&token=b564e9ce-2a3b-467b-94af-81e85e6b6954',
                    videoType: VideoType.network,
                    autoPlay: true,
                    looping: false,
                    showControls: true,
                    allowFullScreen: true,
                    allowPlaybackSpeedMenu: false,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 120, 0, 0),
                    child: Text(
                      'You are about to begin a VR session',
                      style: FlutterFlowTheme.of(context).bodyText1,
                    ).animated([animationsMap['textOnPageLoadAnimation1']]),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                    child: Text(
                      'Please remember to:\n1. Turn off all notifications\n2. Switch to full screen in landscape mode\n3. Place your device in the headset\n4. Sit in a quiet comfortable place',
                      style: FlutterFlowTheme.of(context).bodyText1,
                    ).animated([animationsMap['textOnPageLoadAnimation2']]),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
