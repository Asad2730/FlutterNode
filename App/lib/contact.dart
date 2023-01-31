import 'package:app/customWidgets.dart';
import 'package:app/db.dart';
import 'package:flutter/material.dart';


class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {

  var name = TextEditingController();
  var no = TextEditingController();

  @override
  void dispose() {
    name.dispose();
    no.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _form(),
    );
  }


  Widget _form(){

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 20,),
        const Text(
          'Add Contact',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        const SizedBox(height: 20,),
        myTextField(controllerTxt: name, hintTxt: 'enter name', type: TextInputType.text),
        const SizedBox(height: 20,),
        myTextField(controllerTxt: no, hintTxt: 'enter phone no', type: TextInputType.number),
        const SizedBox(height: 20,),
        myButton(txt: 'Add Contact'),

      ],
    );

  }

  Widget myButton( {required String txt}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: ElevatedButton(
        onPressed: ()=>_submitForm(),
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          primary: Colors.blueAccent,
          minimumSize: const Size(350, 55),
          maximumSize: const Size(350, 55),
        ),
        child: Text(
          txt,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),
    );
  }

  void _submitForm() {

    Db().postContact(name: name.text.toString(), no: no.text.toString());
    name.clear();
    no.clear();
  }

}
