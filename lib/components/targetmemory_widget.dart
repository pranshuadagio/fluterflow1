import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_video_player.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TargetmemoryWidget extends StatefulWidget {
  const TargetmemoryWidget({Key key}) : super(key: key);

  @override
  _TargetmemoryWidgetState createState() => _TargetmemoryWidgetState();
}

class _TargetmemoryWidgetState extends State<TargetmemoryWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        Navigator.pop(context);
      },
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 100, 0, 100),
        child: FlutterFlowVideoPlayer(
          path:
              'https://firebasestorage.googleapis.com/v0/b/adagiovr-b9d3c.appspot.com/o/Preparing%20a%20target%20memory%20(2).mp4?alt=media&token=892f0379-c937-425e-836d-98e872168bdd',
          videoType: VideoType.network,
          autoPlay: true,
          looping: true,
          showControls: true,
          allowFullScreen: true,
          allowPlaybackSpeedMenu: false,
        ),
      ),
    );
  }
}
