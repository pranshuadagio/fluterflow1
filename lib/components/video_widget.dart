import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_video_player.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VideoWidget extends StatefulWidget {
  const VideoWidget({Key key}) : super(key: key);

  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
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
              'https://firebasestorage.googleapis.com/v0/b/adagiovr-b9d3c.appspot.com/o/Tutorial.mp4?alt=media&token=922eb509-3139-4fa2-a9eb-cad44de9537e',
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
