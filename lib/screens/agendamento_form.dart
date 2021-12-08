import 'package:flutter/material.dart';

import 'package:santos_as_cegas/util/form_data.dart';
import 'package:santos_as_cegas/widgets/form.dart';
import 'package:santos_as_cegas/widgets/questions_numbers.dart';
import 'package:santos_as_cegas/screens/agendamento_participacao.dart';

class AgendamentoForm extends StatefulWidget {
  const AgendamentoForm({Key key}) : super(key: key);

  @override
  _AgendamentoFormState createState() {
    return _AgendamentoFormState();
  }
}

class _AgendamentoFormState extends State<AgendamentoForm> {
  PageController controller;
  String question;

  @override
  void initState() {
    super.initState();

    controller = PageController();
    question = formData.first;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
          title: Text('Consentimento de Participação', style: TextStyle(color: Colors.white, fontSize: 18)),
          centerTitle: true,
          backgroundColor: Colors.red,
          elevation: 7,
          actions: <Widget>[],
          flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: <Color>[
            Color(0xff8c1401),
            Color(0xffff3f21)
          ]))),
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(80),
              child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: QuestionsNumbersWidget(
                      questions: formData,
                      question: question,
                      onClickedNumber: (index) {
                        nextFormQuestion(index, true, context);
                      })))),
      body: FormQuestions(onChangedPage: (index) => nextFormQuestion(index, false, context), onSelectOption: (index) => nextFormQuestion(index, true, context), controller: controller));

  void nextFormQuestion(int index, bool jump, BuildContext context) {
    final nextPage = controller.page + 1;
    final indexPage = index ?? nextPage.toInt();

    if (indexPage == formData.length) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => AgendamentoParticipacao()));
    }

    setState(() {
      question = formData[indexPage];
    });

    if (jump) {
      controller.jumpToPage(indexPage);
    }
  }
}
