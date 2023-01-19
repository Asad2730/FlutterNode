import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Db{
  final dio = Dio();
  final ip = '192.168.100.198';
  Db(){
    dio.options.baseUrl = '$ip:3000/';
  }

  Future signup({required String email,required String password}) async{
    try{
     var request =await dio.post('signup',data:{
        'email':email,
        'password':password
      });
    Fluttertoast.showToast(msg: request.data);
    }catch(ex){
      Fluttertoast.showToast(msg: ex.toString());
    }
  }

}