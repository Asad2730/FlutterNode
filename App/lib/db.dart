import 'package:app/navigation.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class Db{
  final dio = Dio();
  final ip = '192.168.10.18';
  static late int uid ;
  static late String userEmail;

  Db(){
    dio.options.baseUrl = 'http://$ip:3000/';
  }

  Future signup({required String email,required String password}) async{
    try{
      if(email.isEmpty && password.isEmpty){
        return;
      }else{
        var request = await dio.post('signup',data:{
          'email':email,
          'password':password
        });
        Fluttertoast.showToast(msg: request.data);
      }
    }catch(ex){
      print(ex);
    }
  }


  Future login({required String email,required String password}) async {
    try{
      if(email.isEmpty && password.isEmpty){
        return;
      }else{
        var request = await dio.get('login/$email/$password');
          uid = request.data[0]['id'];
          userEmail = request.data[0]['email'];
          Navigation.addContact();

      }
    }catch(ex){
      print(ex);
    }
  }

Future postContact({required String name,required String no}) async {
    
  try{
    if(name.isEmpty && no.isEmpty) {
      return;
    } else{
      var request = await dio.post('postData/',data: {
        'name':name,
        'no':no,
        'uid':uid,
      });
      Fluttertoast.showToast(msg: request.data);
    }
  }catch(ex){
    print(ex.toString());
  }
    
}


Future getContacts() async {
    try{
      var request = await dio.get('getData/$uid');
      return request.data as List;
    }catch(ex){
      print(ex);
    }
}

  Future deleteContacts({required int id}) async {
    try{
      var request = await dio.delete('deletePost/$id');
      Fluttertoast.showToast(msg: request.data);
    }catch(ex){
      print(ex);
    }
  }

}