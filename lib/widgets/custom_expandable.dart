import 'package:flutter/material.dart';

class CustomExpandable extends StatefulWidget {
  bool _expanded = false;

  @override
  _CustomExpandableState createState() => _CustomExpandableState();
}

class _CustomExpandableState extends State<CustomExpandable> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.red,
          ),
        ),
        child: ExpansionPanelList(
          animationDuration: Duration(milliseconds: 450),
          elevation: 0,
          children: [
            ExpansionPanel(
              headerBuilder: (context, isExpanded) {
                return ListTile(
                  // leading: Container(
                  //   height: 60,
                  //   width: 60,
                  //   child: ClipRRect(
                  //     child: Image.asset(
                  //       "assets/quem-somos/bike.png",
                  //       height: 60,
                  //       width: 60,
                  //       fit: BoxFit.cover,
                  //     ),
                  //   ),
                  // ),
                  leading: Icon(Icons.psychology, size: 48, color: Colors.red),
                  title: Text(
                    'O que é Santos às Cegas',
                    style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  subtitle: Text(
                    'Conheça mais sobre essa iniciativa.',
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                );
              },
              body: ListTile(
                title: Text('O projeto, com parceria com a Coordenadoria de Defesa de Políticas para Pessoas com Deficiência, da cidade de Santos/SP, propõe a realização de trajetos com bicicleta triciclo tandem (dupla) pela ciclovia da orla da praia, com paradas culturais e sensoriais em monumentos e locais públicos. O projeto atinge pessoas com deficiência visual e outras interessadas nos temas relacionados à inclusão, educação e patrimônio cultural.', style: TextStyle(color: Colors.black, fontSize: 14)),
              ),
              isExpanded: widget._expanded,
              canTapOnHeader: true,
            ),
          ],
          dividerColor: Colors.grey,
          expansionCallback: (panelIndex, isExpanded) {
            setState(() {
              widget._expanded = !isExpanded;
            });
          },
        ));
  }
}
