import 'package:flutter/material.dart';
import 'package:heritage/shared/app_gradient_text.dart';
import 'package:heritage/utilities/app_data.dart';
import 'package:heritage/utilities/app_ui.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailsScreen extends StatefulWidget {
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  AntiqueInfo antique;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    antique = ModalRoute.of(context).settings.arguments;
    YoutubePlayerController _youtubeController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(antique.youtubeURL),
    );
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            antique.title,
            textDirection: TextDirection.rtl,
            style: TextStyle(
              fontSize: 32,
              color: AppUi.yellowColor,
              fontFamily: AppUi.reemKufiFont,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              YoutubePlayer(
                controller: _youtubeController,
                showVideoProgressIndicator: true,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                child: ListView.builder(
                  itemCount: antique.imgsPath.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(
                        16.0,
                      ),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                              color: AppUi.yellowColor,
                              blurRadius: 8.0,
                              spreadRadius: 2.0,
                            )
                          ]),
                      child: Image.asset(
                        antique.imgsPath[index],
                      ),
                    );
                  },
                ),
              ),
              Text(
                antique.content,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                  fontFamily: AppUi.cairoFont,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
