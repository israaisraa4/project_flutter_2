import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _emailTextController;

  late TextEditingController _passwordTextController;
  late TapGestureRecognizer _tapGestureRecognizer;
  bool _obscure = true;
  // يعرف لكل textfaild فاليو كمتغير نصي  نلبل

  String? _emailErrorValue;
  String? _passwordErrorValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tapGestureRecognizer =TapGestureRecognizer();
    // ..  كاني حكتلها رجعني على الانستنس و اعملي اقوتس
    _tapGestureRecognizer =TapGestureRecognizer()..onTap =createNewAccountAction;
    // اعملت فنكشن في فنكشن
   // _tapGestureRecognizer.onTap = createNewAccountAction;
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
  }

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();

    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  void createNewAccountAction(){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'SIGN IN',
          style: GoogleFonts.nunito(
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'SIGN IN',
              style: GoogleFonts.nunito(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 30,
              ),
            ),
            Text(
              'Login to continue your account',
              style: GoogleFonts.nunito(
                color: Color(0xFF716F87),
                height: 0.8,
                fontWeight: FontWeight.w300,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 20),

            TextField(
              controller: _emailTextController,
              // طبيعه الخط يلي بكتبه جواه
              style: GoogleFonts.nunito(),
              // لمااضغط عليها
              onTap: () => print('Tap'),
              // يعطيني النص يلي غيرت عليه
              onChanged: (value) {},
              /*************/
              // هل هو بس للقراءه بقدر انسخ نص
              readOnly: false,
              // ما بقدر تفاعل مع نص false
              // هاي الاقوى
              enabled: true,
              /**************/
              // minLines: 1, // اذا حطيت 2 لازم الماكس اكبر منها
              // maxLines: 4, //هاي انو انا راح اقدر اتمدد لعند 4 اسطر و لكن راح اعمل سكرول داخلي
              /***********/
              maxLines: null,
              minLines: null,
              expands: true,

              /*****************/
              // مكان النص
              textAlign: TextAlign.start,
              // اتجاه النص
              textDirection: TextDirection.ltr,

              /********************/
              // cursorColor:Colors.pink ,
              // cursorWidth: 10,
              // cursorRadius: Radius.circular(10),
              // cursorHeight: 10,
              // اظهر الكيرسر او اخفيه
              // showCursor:  false,
              /***************/
              // لو بتكتب كلمه المرور بعملها نقاط
              // obscureText: true,
              // obscuringCharacter: '-',
              /****************/
              // في لوحة المفاتيح بظهر سيرش بدل صح
              // textCapitalization: TextInputAction.search,
              onSubmitted: (String value) {
                // بعطيني الاشي يلي بجحثت عنه
              },
              /*******************/
              keyboardType: TextInputType.emailAddress,
              // keyboardType: TextInputType.numberWithOptions(signed: false,decimal: false),
              textCapitalization: TextCapitalization.none,
              /**********************/
              maxLength: 30,

              // buildCounter:
              //     (
              //       BuildContext context, {
              //       required int currentLength,
              //       required int? maxLength,
              //       required bool isFocused,
              //     }) {
              //       // لو ضغطت بظهر عدد الاحرف و اذا لا بختفي
              //       return isFocused
              //           ? Text('$currentLength - $maxLength')
              //           : null;
              //     },
              /*************************/
              decoration: InputDecoration(
                /*******************/
                constraints: BoxConstraints(
                  // expands لما استخدم
                  // هيك بصير سكرول عمودي لو دخلت البيانات
                  // 50
                  // 75 لو اعملت كاونتر تكست
                  // او  بعمل counterText ''
                  minHeight: 50,
                  maxHeight: _emailErrorValue == null ? 50 : 75 ,
                ),
                /*********************/
                //  contentPadding: EdgeInsets.zero,
                contentPadding: EdgeInsets.symmetric(horizontal: 20),

                counterText: '',
                // علشان اخفي العداد
                hintText: 'Email',
                hintStyle: GoogleFonts.nunito(),
                hintMaxLines: 1,
                hintTextDirection: TextDirection.ltr,
                // labelText:  'Email',
                // labelStyle: GoogleFonts.nunito(),
                // floatingLabelAlignment: FloatingLabelAlignment.start,
                // // احدد اذا يعمل فلوتنج دائما او لا
                // floatingLabelBehavior: FloatingLabelBehavior.never ,
                /*****************/
                fillColor: Colors.white,
                filled: true,
                // هيا يلي بتشغل ال fill
                /**********************/
                // بيظهر عند الضغط عليها ضمن محتوى الداخلي
                prefixIcon: Icon(Icons.email, color: Colors.grey.shade600),

                // بتظهر لما اضغط
                // لا يحبذ استخدان الايقون ممكن احط تصنين خاص للنص
                // prefix: Icon(Icons.email),
                // prefixText: 'ucas-',
                // بتظهر في كل الحالات ضغطت ام لا بتكون في الاتجاه الاخر
                // suffixIcon:  IconButton(onPressed: (){
                //   }, icon: Icon(Icons.remove_red_eye)),
                // عند ضغط بتظهر
                //  suffix:  Icon(Icons.send),
                // suffixText: 'valid',
                // يمنع استخدام prefix, prefixText مع بعض

                /****************/
                //
                // خارج اطار الحدود
                // icon: Icon(Icons.email,color: Colors.blue,),
                // iconColor: Colors.grey, // اله ارتباط بالثيم

                // /*************/
                // helperText: 'example@ucas.edu.ps',
                // helperStyle: GoogleFonts.nunito(),
                // helperMaxLines: 1,
                /**************************/
                errorText:_emailErrorValue,
                errorStyle:  GoogleFonts.nunito(),
                errorMaxLines: 1,
                /**************************/
                //  enabled: false, // لازم اوقف يلي فوق
                /***********************/
                // اخفي البوردر يلي تحت
                // border: InputBorder.none,
                // ما حدث اي تغير
                //  border: UnderlineInputBorder(
                //      borderSide: BorderSide(
                //        color: Colors.pink,
                //        width: 1,
                //      )
                //  )
                // بعمل اطار و لكن اللون لا يعمل
                // border: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(16),
                //     borderSide: BorderSide(
                //       color: Colors.pink,
                //
                //       width: 1,
                //     )
                // )

                /***************************/
                ////
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey.shade600, width: 1),
                ),

                // عند الضغط عمل بوردر
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey.shade600, width: 1),
                ),
                // disabled هاي بتشتغل لما تكون
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.white, width: 1),
                ),

                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.red, width: 1),
                ),

                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.red.shade600, width: 1),
                ),
              ),

              //  canRequestFocus: false,
            ),
            SizedBox(height: 16),
            TextField(
              controller: _passwordTextController,

              obscureText: _obscure,
              style: GoogleFonts.nunito(),
              // لما تكونobscureText ما بزبط ال null
              //  ممنوع تكون اكبر من واحد في مين و ماكس obscureText
              maxLines: 1,
              minLines: 1,
              expands: false,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                constraints:BoxConstraints(
                    minHeight:  50
                    , maxHeight: _passwordErrorValue == null ? 50 : 75),
              /*************/
                errorText:_passwordErrorValue ,
                errorStyle:  GoogleFonts.nunito(),
                errorMaxLines: 1,
                //**********/
                hintText: 'Password',
                hintStyle: GoogleFonts.nunito(),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey.shade600, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.pink.shade600, width: 1),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.red, width: 1),
                ),

                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.red.shade600, width: 1),
                ),

                prefixIcon: Icon(Icons.lock, color: Colors.grey.shade600),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _obscure = !_obscure;
                    });
                  },
                  icon: Icon(
                    _obscure ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey.shade600,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                performLogin();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade600,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Login',
                style: GoogleFonts.anuphan(color: Colors.white, fontSize: 20),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: RichText(
                text: TextSpan(
                text: 'Don\'t have an account',
                style: GoogleFonts.nunito(
                  color: Colors.grey.shade700
                ),
                children: [
                  TextSpan(text: ' '),
                  TextSpan(text: 'Create Now!',
                  recognizer: _tapGestureRecognizer,
                  style: GoogleFonts.nunito(
                      color: Colors.blue.shade700,
                    decorationStyle: TextDecorationStyle.solid,
                    decoration: TextDecoration.underline,
                    ),

                  ),

                ]
              ),

              ),
            )



          ],
        ),
      ),
    );
  }

  // عمليات عند الضغط على الزر
  // performLogin - checkData => login (Single Responsibility) SOLID

  void performLogin() {
    if (checkData()) {
      login();
    }
  }

  bool checkData() {
    // DRY - Dont Repet Your Self !!!!!!
    if (_emailTextController.text.isNotEmpty &&
        _passwordTextController.text.isNotEmpty) {
      _controlErrorValue();
      return true;
    }
    _controlErrorValue();

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(
      'Error , enter required data',),
      backgroundColor: Colors.red,
      duration: Duration(seconds: 3),
      dismissDirection: DismissDirection.horizontal,

    ));
    return false;
  }

  void _controlErrorValue(){
    setState(() {
      _emailErrorValue = _emailTextController.text.isEmpty ? 'Enter email' : null;
      _passwordErrorValue =_passwordTextController.text.isEmpty ? 'Enter Password' : null;

    });
  }

  void login() {
    Navigator.pushReplacementNamed(context, '/categories_screen');
  }
}
