import 'package:app/db.dart';
import 'package:app/navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget myTextField({required TextEditingController controllerTxt,required String hintTxt,required TextInputType type}){
  return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child:TextField(
        controller: controllerTxt,
        keyboardType: type,
        decoration: InputDecoration(
          hintText: hintTxt,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          )
        ),
      ) ,
  );


}



Drawer myDrawer({required BuildContext context}){

  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
         DrawerHeader(
          decoration:const  BoxDecoration(
            color: Colors.blueAccent,
          ),
          child: CircleAvatar(
            backgroundColor: Colors.green,
            child:Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${Db.userEmail[0].toUpperCase()}${Db.userEmail[1].toUpperCase()}',
                  style:const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),
                ),
                Text(
                    Db.userEmail,
                    style: const TextStyle(
                      fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                    ),
                ),
              ],
            ),
          ),
        ),

        ListTile(
          leading: const Icon(Icons.contact_page),
          title:const Text('Contacts'),
          onTap: (){
            Navigator.of(context).pop();
            Navigation.contactsList();
          },
        ),
        ListTile(
          leading: const Icon(Icons.add),
          title:const Text('Add Contact'),
          onTap: (){
            Navigator.of(context).pop();
            Navigation.addContact();
          },
        ),
        ListTile(
          leading: const Icon(Icons.logout),
          title:const Text('Logout'),
          onTap: (){
            Navigator.of(context).pop();
            Navigation.loginPage();
          },
        ),
      ],
    ),
  );
}