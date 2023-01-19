import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  var email = TextEditingController();
  var password = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
   email.addListener((){
     print('email : ${email.text}');
   });
   password.addListener(() {
     print('password : ${password.text}');
   });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar() ,
      body: _form(),
    );
  }

  Widget _form(){
     return Column(
       mainAxisAlignment: MainAxisAlignment.center,
       mainAxisSize: MainAxisSize.max,
       children: [
           TextField(
             controller: email,
             decoration:const InputDecoration(
               hintText: 'enter email'
             ),
           ),
         TextField(
           controller: password,
           decoration:const InputDecoration(
               hintText: 'enter password'
           ),
         ),
       ],
     );
  }
}
