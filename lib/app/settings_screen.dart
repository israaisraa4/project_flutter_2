import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_flutter/models/category.dart';
import 'package:project_flutter/models/country.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notifications = false;
  RangeValues _priseValues = RangeValues(50, 100);
  String? _gender;
  int? _SelectCuntryValue;
  late TextEditingController _experienceController;

  List<String> _experients = <String>[] ;


  //  Categories List
  final List<Category> _category = <Category>[
    Category(title: 'T-Shirts'),
    Category(title: 'Jackets'),
    Category(title: 'Polo'),
  ];

  //  Country List
  final List<Country> _country = <Country>[
    const Country(id: 1, title: 'Palestine'),
    const Country(id: 2, title: 'Eypt'),
    const Country(id: 3, title: 'Moroco'),
    const Country(id: 4, title: 'Jorden'),
  ];


  @override
  void initState() {
    _experienceController =TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _experienceController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      children: [
        SwitchListTile(
          activeColor: Colors.purple,
          activeTrackColor: Colors.purple.shade800,

          /************/
          inactiveTrackColor: Colors.pink.shade100,
          // الدويره السودة
          inactiveThumbColor: Colors.pink.shade300,

          value: _notifications,
          title: Text('Notifications', style: GoogleFonts.montserrat()),
          subtitle: Text(
            'Turn Notifications On/Off',
            style: GoogleFonts.montserrat(),
          ),
          onChanged: (bool value) {
            setState(() {
              _notifications = value;
            });
          },
        ),
        // price range section
        SizedBox(height: 20),
        Text(
          'Notfications',
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        RangeSlider(
          // كم معيار تقسيم الخط
          divisions: 10,
          labels: RangeLabels(
            _priseValues.start.toString(),
            _priseValues.end.toString(),
          ),
          min: 10,
          max: 200,
          values: _priseValues,
          onChanged: (RangeValues value) {
            setState(() {
              _priseValues = value;
            });
          },
        ),

        // gender section
        SizedBox(height: 20),
        Text(
          'Gender',
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        Row(
          children: [
            // نوعها T فانا بعطيها قيم
            Expanded(
              child: RadioListTile<String>(
                value: 'F',
                groupValue: _gender,
                title: Text('Female'),
                onChanged: (String? value) {
                  setState(() {
                    _gender = value;
                  });
                },
              ),
            ),

            Expanded(
              child: RadioListTile<String>(
                value: 'M',
                groupValue: _gender,
                title: Text('Male'),
                onChanged: (String? value) {
                  setState(() {
                    _gender = value;
                  });
                },
              ),
            ),
          ],
        ),
        // gender section
        SizedBox(height: 20),
        Text(
          'Categories',
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        // لاني في ليست ما بفتح اقواس
        for (Category category in _category)
          CheckboxListTile(
            value: category.checked,
            title: Text(category.title),
            checkboxShape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(5),
            ),

            activeColor: Colors.pink,
            checkColor: Colors.white,

            onChanged: (value) {
              if (value != null) {
                // flow Analysis
                setState(() {
                  category.checked = value;
                });
              }
            },
          ),

        // Country section
        SizedBox(height: 20),
        Text(
          'Country',
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        DropdownButton<int>(
          isExpanded: true,
          hint: Text('choose the cuntry'),
          // هنا انا في ليستا فبتاخذ ويدجت مش ليست
          items: _country.map((country) {
            return DropdownMenuItem<int>(
              value: country.id,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(country.title),
                  Divider()
                ],
              ),
            );
          }).toList(),
          value: _SelectCuntryValue,
          onChanged: (int? value) {
            setState(() {
              _SelectCuntryValue = value;
            });
          },

          onTap: () {},
          borderRadius: BorderRadius.circular(10),
          icon: Icon(Icons.arrow_circle_down_sharp),
          itemHeight: 48,
          underline: Divider(height: 0,),
          selectedItemBuilder: (BuildContext context) {
            //ممكن استخدكخا لو بدي شكل مختلف زي الدول و العلم
          return  _SelectCuntryValue != null ?
             _country.map((e) =>
             Align(
               alignment: AlignmentDirectional.centerStart,
               child: e.id == 1 ?Text(
                _country
                    .firstWhere((element) => element.id == _SelectCuntryValue)
                    .title ,style: TextStyle(color: Colors.orange),
                           ) :
                  Text(
                  _country
                  .firstWhere((element) => element.id == _SelectCuntryValue)
                  .title,
                           ),
             )
            ).toList()

                :  [];
          },
        ),
        // Experiences section
        SizedBox(height: 20),
        Text(
          'Experiences',
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        TextField(
          controller: _experienceController,
          keyboardType: TextInputType.text,
          style: GoogleFonts.montserrat(),
          maxLength: 15,
          textInputAction: TextInputAction.done,
          onSubmitted: (String value){
            _performSave();

          },
          decoration: InputDecoration(
            hintText: 'Enter experience',
            hintStyle: GoogleFonts.montserrat(),
            prefixIcon: Icon(Icons.work),
            suffixIcon: IconButton(
              onPressed: (){
                _performSave();
              }, icon: Icon(Icons.save)),
            counterText: '',


          ),

        ),
        Wrap(
          spacing: 10,
          children: _experients.map((e) {
            return Chip(
              padding: EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(16)
              ),
              elevation: 5,
              avatar: Icon(Icons.work ,color: Colors.white,),
              backgroundColor: Color(0xff1c3879),
              labelStyle: TextStyle(color: Colors.white),
              label: Text(e),
            /***************/
              deleteIcon: Icon(Icons.close),
              deleteIconColor: Colors.red,
              onDeleted: (){
                _delete(e);
              },

            );
          }
          ).toList()
        )


      ],
    );
  }

  void _performSave(){
    if(_checkData()){
      _save();
    }

  }

  bool _checkData(){
    if(_experients.length < 6) {
      if (_experienceController.text.isNotEmpty) {
        return true;
      } else {
        showMessage('please enter experients');
        return false;
      }
    }

    showMessage('You have reached the limit data count ');
    return false;

  }

  void showMessage(String message){
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content:Text(message)
          ,backgroundColor: Colors.red,
        )
    );
  }



  void _save(){
    setState(() {
      _experients.add(_experienceController.text);
      _experienceController.clear();
    });

  }

  void _delete(String experience){
    setState(() {
      _experients.remove(experience);
    });
    //  _experients.removeWhere((element) => element == experience );
  }
}
