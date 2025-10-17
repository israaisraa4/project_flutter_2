import 'package:flutter/material.dart';
import 'package:project_flutter/models/faq.dart';
class FrequentQuestionsScreen extends StatefulWidget {
  const FrequentQuestionsScreen({super.key});

  @override
  State<FrequentQuestionsScreen> createState() => _FrequentQuestionsScreenState();
}
List<Faq> _faqs = <Faq>[
  Faq(question: 'What are your from', answer: 'Iam from gaza'),
  Faq(question: 'How old  are you', answer: '21 year'),
  Faq(question: 'How old  are you', answer: '21 year'),
  Faq(question: 'How old  are you', answer: '21 year'),
];

class _FrequentQuestionsScreenState extends State<FrequentQuestionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Frequent Questions')),
      body: ListView.builder(
          itemCount: _faqs.length,
          itemBuilder: (context,index){
            return ExpansionTile(
              title: Text(_faqs[index].question ),
              initiallyExpanded: false, // راح يفتحهم كلهم اذا ترو
             // مكان الاجابه
              expandedAlignment: Alignment.centerLeft,
              //ما في مساحه علشام هيك مش مبينه 
              expandedCrossAxisAlignment: CrossAxisAlignment.end,
              
              tilePadding: const EdgeInsets.all(5),
              childrenPadding:const EdgeInsets.all(10),
              // Expanded active Color
              textColor: Colors.red,
              backgroundColor: Colors.cyan.shade100,
              iconColor: Colors.red,
              // Collapsed unActive color
              collapsedTextColor: Colors.blue,
              collapsedBackgroundColor: Colors.grey.shade300,
              collapsedIconColor: Colors.black,

              leading: Icon(Icons.question_answer),
              onExpansionChanged: (bool value){
              // تحديث لحاله العنصر حاليا

              },
              children: [
                Text(_faqs[index].answer )
              ],
            );
          },
      ),
    );
  }
}
