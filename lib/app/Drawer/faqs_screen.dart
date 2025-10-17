import 'package:flutter/material.dart';
import 'package:project_flutter/models/faq.dart';

class FaqsScreen extends StatefulWidget {
  const FaqsScreen({super.key});

  @override
  State<FaqsScreen> createState() => _FaqsScreenState();
}

class _FaqsScreenState extends State<FaqsScreen> {
  List<Faq> _faqs = <Faq>[
    Faq(question: 'What are your from', answer: 'Iam from gaza'),
    Faq(question: 'How old  are you', answer: '21 year'),
    Faq(question: 'How old  are you', answer: '21 year'),
    Faq(question: 'How old  are you', answer: '21 year'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FAQs')),

      body: ListView(
        children: [
          ExpansionPanelList(
            elevation: 4,
            expandedHeaderPadding: EdgeInsets.zero,
            dividerColor:const Color(0xFF6074AA),
            animationDuration:  Duration(seconds: 1),
            expansionCallback: (paneIndex, isExpanded) {
              setState(() {
                print(isExpanded);
                _faqs[paneIndex].isExpanded = isExpanded;
              });
            },

            children: _faqs.map((e) {
              return ExpansionPanel(
                canTapOnHeader: true,
                isExpanded: e.isExpanded,
                headerBuilder: (context, isExpanded) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.question_answer),
                        SizedBox(width: 5,),
                        Text(e.question),
                      ],
                    ),
                  );
                },
                body: Text(e.answer ,style: TextStyle(color: Colors.black),),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
