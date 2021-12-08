import 'package:flutter/material.dart';

class QuestionsNumbersWidget extends StatelessWidget {
  final List<String> questions;
  final String question;
  final ValueChanged<int> onClickedNumber;

  const QuestionsNumbersWidget({Key key, @required this.questions, @required this.question, @required this.onClickedNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double padding = 16;

    return Container(
      height: 60,
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: padding),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => Container(width: padding),
        itemCount: questions.length,
        itemBuilder: (context, index) {
          final isSelected = question == questions[index];

          return buildNumber(index: index, isSelected: isSelected);
        },
      ),
    );
  }

  Widget buildNumber({
    @required int index,
    @required bool isSelected,
  }) {
    final color = isSelected ? Colors.red[300] : Colors.white;

    return GestureDetector(
        onTap: () => onClickedNumber(index),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(blurRadius: 7, color: Colors.black45, spreadRadius: 1, offset: Offset(3, 5))
            ],
          ),
          child: CircleAvatar(
            backgroundColor: color,
            child: Text(
              '${index + 1}',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ));
  }
}
