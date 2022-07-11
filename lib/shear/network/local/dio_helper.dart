import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

const String urilink = "http://172.27.128.1:8080";
const String insairtData = "$urilink/news_app/aouth/insairt_data.php";
const String GETAllData_full = "$urilink/news_app/aouth/showdata.php";
const String UpdateData = "$urilink/news_app/aouth/Update_final.php";
const String DeleteData = "$urilink/news_app/aouth/deletdata.php";

class Dio_helper {
  static Dio? dio;


  static init() {

    dio = Dio(BaseOptions(
      baseUrl: "$urilink",
      receiveDataWhenStatusError: true,
        headers: {
        "Access-Control-Allow-Origin": "*",
          "Access-Control-Allow-Credentials":true,
          "Access-Control-Allow-Headers":   "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
          "Access-Control-Allow-Methods":"GET, HEAD, POST, OPTIONS",
          "origin": ["*"],
          "method": ["GET"],
          "maxAgeSeconds": 3600
        }
        ,
    ));
  }

  static FormData bodyData({
required Map<String,dynamic>map
  }) {
    return FormData.fromMap(map);
  }


  static Future postData({var body ,String ? path}) async {
    return await dio!.post("$path",data: body);

  }

  static Future postData_justthis({var body ,String ? path}) async {
    Response response=await dio!.post("$path",data: body);
    return await jsonDecode(response.data);
  }



static Future gitAllData()async {
  Response response = await dio!.get('$GETAllData_full');
  return await jsonDecode(response.data);
}


}


