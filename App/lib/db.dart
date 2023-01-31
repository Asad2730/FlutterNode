import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Db{
  final dio = Dio();
  Db(){
    dio.options.baseUrl = 'http://192.168.100.198:3000/';
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
        //List data = request.data as List;
        print(request.data[0]['id']);
        print(request.data[0]['email']);
        print(request.data[0]['password']);
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
        'uid':1,
      });
      print(request.data);
    }
  }catch(ex){
    print(ex.toString());
  }
    
}


}