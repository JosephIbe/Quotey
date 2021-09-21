import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:quotey/data/core/api_constants.dart';

class APIClient {

  dynamic getAllQuotes() async {
    try {
      Response response = await Dio().get(APIConstants.API_BASE_URL);
      // print('API Response\t$response');
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioError catch (e){
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if(e.response != null) {
        print(e.response.data);
        print(e.response.headers);
        print(e.response.request);
      } else{
        // Something happened in setting up or sending the request that triggered an Error
        print(e.request);
        print(e.message);
      }
    }
  }

}