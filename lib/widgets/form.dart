import 'package:flutter/material.dart';

import 'package:santos_as_cegas/util/form_data.dart';
import 'package:santos_as_cegas/widgets/custom_divider.dart';

class FormQuestions extends StatelessWidget {
  final ValueChanged<int> onChangedPage;
  final ValueChanged<int> onSelectOption;
  final PageController controller;

  const FormQuestions({Key key, @required this.onChangedPage, @required this.onSelectOption, @required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) => PageView.builder(
      onPageChanged: onChangedPage,
      controller: controller,
      itemCount: formData.length,
      itemBuilder: (context, index) {
        final question = formData[index];

        return Container(padding: const EdgeInsets.all(16), child: buildQuestion(question: question));
      });

  Widget buildQuestion({@required question}) => Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        CustomDivider(),
        Padding(
          padding: new EdgeInsets.all(15.0),
          child: Text(question, textAlign: TextAlign.justify, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ),
        SizedBox(height: 32),
        Expanded(
            child: Padding(
                padding: EdgeInsets.all(24),
                child: Column(children: [
                  GestureDetector(
                    onTap: () => {
                      onClickedOption('a')
                    },
                    child: Container(
                        // color: rowOptionABackground,
                        child: Row(children: [
                      Container(
                          width: 50,
                          height: 50,
                          decoration: new BoxDecoration(
                            color: Colors.grey[350],
                            shape: BoxShape.circle,
                          ),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center, children: [
                            Text("A", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24))
                          ])),
                      SizedBox(width: 12),
                      Text(
                        "Sim",
                        style: TextStyle(fontSize: 20),
                      )
                    ])),
                  ),
                  SizedBox(height: 30),
                  GestureDetector(
                    onTap: () => {
                      onClickedOption('b')
                    },
                    child: Container(
                        // color: rowOptionBBackground,
                        child: Row(children: [
                      Container(
                          width: 50,
                          height: 50,
                          decoration: new BoxDecoration(
                            color: Colors.grey[350],
                            shape: BoxShape.circle,
                          ),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center, children: [
                            Text("B", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24))
                          ])),
                      SizedBox(width: 12),
                      Text(
                        "Não",
                        style: TextStyle(fontSize: 20),
                      )
                    ])),
                  )
                ]))),
      ]);

  void onClickedOption(option) {
    onSelectOption((controller.page + 1).toInt());
  }
}
