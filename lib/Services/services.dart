import 'dart:convert';
import 'package:covied_19/Model/world_state_model.dart';
import 'package:covied_19/Services/Utillites/app_url.dart';
import 'package:http/http.dart' as http;

class ServicesState {

  // fatch api
  Future <WorldModel> getWroldApi()async{

    final response = await http.get(Uri.parse(AppUrl.worldStateApi));

    if ( response.statusCode == 200){
      var data = jsonDecode(response.body.toString());
      return WorldModel.fromJson(data);
    } else{
      throw Exception("Error");
    }
  }

   // fatch countries api
  Future <List<dynamic>> getWroldCountriesApi()async{
     var data ;
    final response = await http.get(Uri.parse(AppUrl.countriesList));

    if ( response.statusCode == 200){
       data = jsonDecode(response.body.toString());
      return data;
    } else{
      throw Exception("Error");
    }
  }
}