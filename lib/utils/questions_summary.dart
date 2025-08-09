import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({required this.summaryData, super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  constraints: BoxConstraints(minWidth: 30, maxWidth: 30),
                  transformAlignment: Alignment.topCenter,
                  padding: EdgeInsets.all(5),
                  alignment: Alignment.topCenter,
                  decoration: BoxDecoration(
                    color: data['userAnswer'] == data['correctAnswer']
                        ? Colors.lightBlue
                        : Color.fromARGB(255, 221, 131, 234),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    ((data['questionIndex'] as int) + 1).toString(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['question'] as String,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(height: 5),
                      Text(
                        data['userAnswer'] as String,
                        style: TextStyle(
                          color: const Color.fromARGB(255, 221, 131, 234),
                        ),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        data['correctAnswer'] as String,
                        style: TextStyle(color: Colors.lightBlue),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
