import 'package:contolpanal_flutter/moduols/delete/delete_massage_screen.dart';
import 'package:contolpanal_flutter/moduols/delete/delete_screen.dart';
import 'package:contolpanal_flutter/moduols/delete/delete_showdata.dart';
import 'package:contolpanal_flutter/moduols/insart/insairtDatascreen.dart';
import 'package:contolpanal_flutter/moduols/show_data/showdatafromdatabase.dart';
import 'package:contolpanal_flutter/moduols/update/update_showdata_screen.dart';
import 'package:contolpanal_flutter/moduols/update/update_title_screen.dart';
import 'package:contolpanal_flutter/moduols/update/updatedata.dart';
import 'package:contolpanal_flutter/shear/Cubit/App_state.dart';
import 'package:contolpanal_flutter/shear/network/local/dio_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class App_Cubit extends Cubit<App_State> {
  App_Cubit() : super(App_inatualState());

  static App_Cubit git(context) => BlocProvider.of(context);

  /*#####  If the mouse comes over the button   #####****/

  int WhatisOn = 0;

  int currentindex = 0;
  int currentindex_ShowDataFreomDatabase = 0;

  int updatecurruntindex = 0;

  String routname = "/Home";
  List<Widget> center_screens = [
    Container(),
    Container(
      child: Center(
        child: Text(
          'Hi Admin',
          style: TextStyle(fontSize: 50, fontWeight: FontWeight.w700),
        ),
      ),
    ),
    ShowDataFreomDatabase(),
    const InsairtDatascreen(),
    UpdateData_screen(),
    const Delet_Screen(),
    Container(),
    Container(),
    Container(),
  ];

  void currentindex_ShowDataFreomDatabase_change(int index) {
    currentindex_ShowDataFreomDatabase = index;
    emit(currentindex_ShowDataFreomDatabase_change_State());
  }

  var scrolcontrolar_toshow = ScrollController();

  Map<dynamic, dynamic> GETAllDataFromDatabase = {};
  Map<dynamic, dynamic> UpdateAllDatashow = {};
  Map<dynamic, dynamic> UpdateAllDatashow_updat = {};
  Map<dynamic, dynamic> UpdateAllDatashow_updat_id = {};

  List<Widget> updatescreens = [
    const Update_Show_Data_screen(),
    const Update_title_Screen(),
  ];

  List<Widget> ShowData = [
    ShowDataFreomDatabase(),
  ];
  List<Widget> deletescreens = [
    const Delete_Show_Data(),
    const Delete_Massege_Screen(),
  ];

  int deletcurrantindex = 0;

  void GETAllData() {
    emit(GETDATALodingState());
    Dio_helper.gitAllData().then((value) {
      GETAllDataFromDatabase.addAll(value);
      currentindex_ShowDataFreomDatabase_change(2);

      emit(GETAllData_sucsses_State());
    }).catchError((error) {
      print(error.toString());
      emit(GETDATAerrorState(error.toString()));
    });
  }

  /*#######  These variables are stored in the input values of adding data  #######*/

  TextEditingController title_controlar = TextEditingController();
  TextEditingController description_controlar = TextEditingController();
  TextEditingController Url_controlar = TextEditingController();
  TextEditingController urlToImage_controlar = TextEditingController();
  TextEditingController UrlTovieo_controlar = TextEditingController();
  TextEditingController Date_controlar = TextEditingController();

  //__________________________________________________________________________________

  TextEditingController title_controlar_update = TextEditingController();
  TextEditingController description_controlar_update = TextEditingController();
  TextEditingController Url_controlar_update = TextEditingController();
  TextEditingController urlToImage_controlar_update = TextEditingController();
  TextEditingController UrlTovieo_controlar_update = TextEditingController();
  TextEditingController Date_controlar_update = TextEditingController();

  //_______________________________________________________________________________

  void PostData_toDatabase() {
    emit(Loding_Staate());
    Dio_helper.postData(
        path: "$insairtData",
        body: Dio_helper.bodyData(map: {
          "title": title_controlar.text,
          "description": description_controlar.text,
          "Url": Url_controlar.text,
          "urlToImage": urlToImage_controlar.text,
          "UrlTovieo": UrlTovieo_controlar.text,
          "Date": Date_controlar.text,
        })).then((value) {

      print(value.data.toString());
      updateData_tofunction(statuse: '*');
      title_controlar.text = "";
      description_controlar.text = "";
      Url_controlar.text = "";
      urlToImage_controlar.text = "";
      UrlTovieo_controlar.text = "";
      Date_controlar.text = "";

      emit(Sucsees_State());
    }).catchError((error) {
      print(error.toString());
      emit((error_State(error.toString())));
    });
  }

  void WhatisOn_change(int index) {
    WhatisOn = index;
    emit(WhatisOn_change_State());
  }

  void currentindex_change(int index) {
    currentindex = index;
    emit(currentindex_change_State());
  }

  Future openlink({required String path}) async {
    var url = Uri.parse("$path");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  int id_curruntindex = 70;

  void UpdateDatamethod_show_allData({
    required String? statuse,
    String? id_update,
    String? titel_update,
    String? description_updat,
    String? Url_update,
    String? urlToImage_upadate,
    String? UrlTovieo_update,
    String? Date_update,
  }) {
    emit(UpdateLodingState());
    Dio_helper.postData_justthis(
        path: "$UpdateData",
        body: Dio_helper.bodyData(map: {
          "id_status": statuse,
          "id_update": id_update,
          "titel_update": titel_update,
          "description_updat": description_updat,
          "Url_update": Url_update,
          "urlToImage_upadate": urlToImage_upadate,
          "UrlTovieo_update": UrlTovieo_update,
          "Date_update": Date_update,
        })).then((value) {
      if (statuse == "*") {
        UpdateAllDatashow.addAll(value);

        emit(UpdateData_sucsses_State());
      } else if (statuse == "update") {
        UpdateAllDatashow_updat.addAll(value);
        print(value);
        updateData_tofunction(statuse: '*');
        emit(UpdateData_sucsses_State_update());
      } else if (statuse == "id") {
        UpdateAllDatashow_updat_id.addAll(value);
        print(value);
        updateData_tofunction(statuse: '*');
        emit(UpdateData_sucsses_State_id());
      }
    }).catchError((error) {
      emit(UpdateerrorState(error.toString()));
    });
  }

  void updatecurrantindex_cange(int index) {
    updatecurruntindex = index;
    updateData_tofunction(statuse: '*');
    emit(updatecurrantindex_cange_State());
  }

  void deletecurrantindex_cange(int index) {
    deletcurrantindex = index;
    updateData_tofunction(statuse: '*');
    emit(deletecurrantindex_cange_State());
  }

  void DeleteDatafromDtabase({
    required String id,
  }) {
    Dio_helper.postData_justthis(
        path: "$DeleteData",
        body: Dio_helper.bodyData(map: {"id_data": id})).then((value) {
      print(value);
      updateData_tofunction(statuse: '*');
      emit(DeleteDatafromDtabase_State());
    }).catchError((error) {
      print(error.toString());
      emit(DeleteDatafromDtabase_error_State(error.toString()));
    });
  }

  void id_curruntindex_change(int index) {
    id_curruntindex = index;
    emit(id_curruntindex_change_State());
  }

  void updateData_tofunction({
    required String statuse,
  }) {
    UpdateDatamethod_show_allData(statuse: statuse);
    GETAllData();
    emit(updateData_tofunction_State());
  }
}
