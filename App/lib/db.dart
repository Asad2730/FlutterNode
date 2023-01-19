import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Db{
  final dio = Dio();
  Db(){
    dio.options.baseUrl = 'http://192.168.100.198:3000/';
  }

  Future signup({required String email,required String password}) async{
    try{
     var request = await dio.post('signup',data:{
        'email':email,
        'password':password
      });
    Fluttertoast.showToast(msg: request.data);
    }catch(ex){
      print(ex);
    }
  }

}