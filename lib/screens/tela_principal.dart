import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'package:santos_as_cegas/widgets/custom_button.dart';
import 'package:santos_as_cegas/widgets/custom_expandable.dart';

class TelaPrincipal extends StatefulWidget {
  final PageController controller;

  const TelaPrincipal({Key key, @required this.controller}) : super(key: key);

  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  YoutubePlayerController youtubeController = YoutubePlayerController(
    initialVideoId: 'VLxquanRaNo',
    flags: YoutubePlayerFlags(
      autoPlay: false,
      mute: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: new EdgeInsets.all(15.0),
          child: Text(
            "Bem-vindo!",
            style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold, color: Colors.red),
          ),
        ),
        Container(padding: new EdgeInsets.all(15.0), child: CustomButton(controller: widget.controller, page: 2)),
        Container(padding: new EdgeInsets.all(15.0), child: CustomExpandable()),
        Container(
          padding: new EdgeInsets.all(15.0),
          child: YoutubePlayer(
            controller: youtubeController,
            showVideoProgressIndicator: true,
            liveUIColor: Colors.red,
            progressIndicatorColor: Colors.red,
          ),
        ),
        Padding(
            padding: new EdgeInsets.only(left: 15.0, top: 5.0, bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Santos ás Cegas - Teaser",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                Text(
                  "Renato Frosch",
                  style: TextStyle(fontSize: 15.0, color: Colors.black),
                ),
              ],
            )),
      ],
    ));
  }
}
