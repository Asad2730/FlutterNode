import 'package:app/customWidgets.dart';
import 'package:app/db.dart';
import 'package:flutter/material.dart';


class Contacts extends StatefulWidget {
  const Contacts({Key? key}) : super(key: key);

  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {

  late Future _future;
  @override
  Widget build(BuildContext context) {
    _future = Db().getContacts();
    return Scaffold(

      appBar: AppBar(),
      body: _futureBuilder(),
      drawer: myDrawer(context: context),
    );
  }


  Widget _futureBuilder(){

    return FutureBuilder(
        future: _future,
        builder: (context,snapshot){
           if(snapshot.hasData){
             return _list(snapshot: snapshot);
           }else{
             return const CircleAvatar();
           }
        }
    );
  }


  Widget _list({required AsyncSnapshot snapshot}){
      return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: snapshot.data.length,
          itemBuilder: (context,i){
            Map data = snapshot.data[i];
            return Card(
              color: Colors.white70,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: ListTile(
                leading: Text(data['name']),
                title: Text('${data['no']}'),
                trailing: TextButton(
                  child: const Text(
                      'Delete',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent,
                    ),
                  ),
                  onPressed: (){
                    Db().deleteContacts(id: data['id']);
                    setState(() {});
                  },
                ),

              ),
            );
          }
      );
  }

}
