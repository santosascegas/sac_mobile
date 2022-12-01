import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:santos_as_cegas/util/blogService.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:santos_as_cegas/widgets/audio_player.dart';

class Blog extends StatefulWidget {
  const Blog({Key key}) : super(key: key);

  @override
  _BlogState createState() => _BlogState();
}

class _BlogState extends State<Blog> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: new EdgeInsets.all(15.0),
          child: Text(
            "Blog",
            style: TextStyle(
                fontSize: 35.0, fontWeight: FontWeight.bold, color: Colors.red),
          ),
        ),
        FutureBuilder(
            future: BlogService.getPostagens(),
            builder:
                (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
              if (snapshot.hasData && snapshot.data.length > 0) {
                List<dynamic> posts = snapshot.data;
                return Flexible(
                    child: ListView.builder(
                  itemCount: posts.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 3.0, color: Colors.red)),
                          padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 60, 0, 0),
                              ),
                              Container(
                                child: checkForImage(posts[index]),
                              ),
                              // Perguntas
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    color: Color.fromRGBO(0, 0, 0, 0.05)),
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.fromLTRB(40, 15, 40, 15),
                                child: Column(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(15),
                                              child: Text(
                                                ">",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Flexible(
                                                child: Text(
                                              "Você recomendaria o trajeto para outras pessoas?",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ))
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(62, 0, 0, 0),
                                          child: checkQuestion(
                                              posts[index]["question_1"]),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(15),
                                              child: Text(
                                                ">",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Flexible(
                                                child: Text(
                                              "Você desejaria realizar o passeio novamente?",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ))
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(62, 0, 0, 0),
                                          child: checkQuestion(
                                              posts[index]["question_2"]),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              // Audio
                              Container(
                                margin: EdgeInsets.all(10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    if (posts[index]["audio"]["path"] != null)
                                      SizedBox(
                                        width: 300,
                                        height: 54,
                                        child:
                                            checkAudio(posts[index]["audio"]),
                                      )
                                  ],
                                ),
                              ),
                              // Text
                              Container(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  posts[index]["message"].toString(),
                                  style: TextStyle(fontSize: 18, height: 1.255),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          verticalDirection: VerticalDirection.down,
                          children: [
                            Container(
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(color: Colors.white),
                              width: 60,
                              height: 60,
                              child: Center(
                                child: SvgPicture.asset('assets/quotes.svg',
                                    width: 20, height: 20),
                              ),
                            ),
                            Container(
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  verticalDirection: VerticalDirection.down,
                                  children: [
                                    Text(
                                      posts[index]["name"].toString(),
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(dataISO(posts[index]["created_at"]),
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: Colors.black54))
                                  ]),
                            )
                          ],
                        ),
                      ],
                    );
                  },
                ));
              } else if(!snapshot.hasData) {
                return CircularProgressIndicator();
              } else {
                return Center(child: Text("Nenhum post disponível."),);
              }
            })
      ],
    );
  }

  Widget checkAudio(audio) {
    if (audio["path"] == null) {
      return Container();
    }

    return AudioPlayerW(audio["id"].toString());
  }

  Widget checkQuestion(question) {
    if (question) {
      return Text("Sim");
    }

    return Text("Não");
  }

  Widget checkForImage(post) {
    if (post["image"]["path"] == null) {
      return Container();
    }

    return Container(
        child: Image.network(
            'http://localhost:8080/files/get/${post["image"]["id"]}'));
  }

  String dataISO(String iso) {
    DateTime utcTime = DateTime.parse(iso);
    DateTime localTime = utcTime.toLocal();
    DateFormat formatter = DateFormat('dd/MM/yyyy');
    return "${formatter.format(localTime)}";
  }
}
