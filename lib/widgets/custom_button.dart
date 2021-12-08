import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final PageController controller;
  final int page;

  CustomButton({this.controller, this.page});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => changePage(),
        child: Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.red,
              ),
            ),
            child: Row(children: [
              Container(
                padding: EdgeInsets.only(right: 10.0),
                height: 150,
                width: 150,
                child: ClipRRect(
                  child: Image.asset(
                    "assets/quem-somos/bike.png",
                    height: 150,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Flexible(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  "Agendamento",
                  style: TextStyle(fontSize: 20.0, color: Colors.red, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    "Realize seu agendamento e venha fazer parte desta experiência.",
                    style: TextStyle(fontSize: 16.0, color: Colors.black),
                  ),
                )
              ])),
            ])));
  }

  void changePage() {
    controller.jumpToPage(page);
  }
}
