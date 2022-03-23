import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_video_player.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProspectusWidget extends StatefulWidget {
  const ProspectusWidget({Key key}) : super(key: key);

  @override
  _ProspectusWidgetState createState() => _ProspectusWidgetState();
}

class _ProspectusWidgetState extends State<ProspectusWidget> {
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
              'https://firebasestorage.googleapis.com/v0/b/adagiovr-b9d3c.appspot.com/o/Prospectus%20(2).mp4?alt=media&token=3aebfca1-74a3-4650-8b30-64c5b52bf735',
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
