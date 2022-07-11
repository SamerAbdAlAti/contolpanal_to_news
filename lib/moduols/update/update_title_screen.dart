import 'dart:async';

import 'package:contolpanal_flutter/shear/Cubit/App_cubit.dart';
import 'package:contolpanal_flutter/shear/Cubit/App_state.dart';
import 'package:contolpanal_flutter/shear/componanats/componants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class Update_title_Screen extends StatelessWidget {
  const Update_title_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool ?isloging;
    return BlocConsumer<App_Cubit, App_State>(

      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        var formkey = GlobalKey<FormState>();
        var scrollcontrolar = ScrollController();
        App_Cubit cubit = App_Cubit.git(context);
        var data = cubit.UpdateAllDatashow_updat_id["0"][0];
        cubit.title_controlar_update.text = "${data["titel"]}";
        cubit.description_controlar_update.text = "${data["description"]}";
        cubit.Url_controlar_update.text = "${data["Url"]}";
        cubit.urlToImage_controlar_update.text = "${data["urlToImage"]}";
        cubit.UrlTovieo_controlar_update.text = "${data["UrlTovieo"]}";
        cubit.Date_controlar_update.text = "${data["Date"]}";

        return Form(
          key: formkey,
          child: Padding(
            padding: const EdgeInsets.only(top: 50, left: 50, right: 50),
            child: ListView(
              controller: scrollcontrolar,
              children: [
                Container(
                    child: build_insairtData_field(
                        maxlins: 2,
                        title: "أدخل العنوان ",
                        controlar: cubit.title_controlar_update,
                        hintText: "أدخل عنوان الموضوع")),
                Container(
                    child: build_insairtData_field(
                        maxlins: 10,
                        title: "التفاصيل",
                        controlar: cubit.description_controlar_update,
                        hintText: "أدخل تفاصيل الموضوع")),
                Container(
                    child: build_insairtData_field(
                        maxlins: 2,
                        title: "رابط الموقع",
                        controlar: cubit.Url_controlar_update,
                        hintText: "أدخل رابط المصدر")),
                Container(
                    child: build_insairtData_field(
                        maxlins: 2,
                        title: "رابط الصورة",
                        controlar: cubit.urlToImage_controlar_update,
                        hintText: "أدخل رابط الصورة")),
                Container(
                    child: build_insairtData_field(
                        ishavevaledator: false,
                        maxlins: 2,
                        title: "( Optional ) رابط الفيديو ",
                        controlar: cubit.UrlTovieo_controlar_update,
                        hintText: "رابط الفيديو إن وجد")),
                Container(
                  child: build_insairtData_field(
                      typ: TextInputType.none,
                      maxlins: 1,
                      title: "التاريخ",
                      controlar: cubit.Date_controlar_update,
                      hintText: "أنقر لإدخال التاريخ",
                      onTap: () {
                        showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime.parse("2030-05-05"))
                            .then((value) {
                          cubit.Date_controlar_update.text =
                              DateFormat.yMMMMEEEEd().format(value!);
                        });
                      }),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 50,
                      width: 220,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(60)),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: MaterialButton(
                        onPressed: () {
                          cubit.updatecurrantindex_cange(0);
                        },
                        child: Text(
                          "الخروج بدون تعديل",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                      height: 50,
                      width: 220,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(60)),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: MaterialButton(
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            cubit.UpdateDatamethod_show_allData(
                              statuse: "update",
                              id_update: "${data["id"]}",
                              titel_update: cubit.title_controlar_update.text,
                              description_updat:  cubit.description_controlar_update.text,
                              Url_update:  cubit.Url_controlar_update.text,
                              urlToImage_upadate:  cubit.urlToImage_controlar_update.text,
                              UrlTovieo_update:  cubit.UrlTovieo_controlar_update.text,
                              Date_update:  cubit.Date_controlar_update.text,
                            );
                            cubit.updatecurrantindex_cange(0);
                            Timer(Duration(milliseconds:100),(){

                            });

                          }
                        },
                        child: Text(
                          "حفظ البيانات",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    state is UpdateData_sucsses_State_update
                        ? Text(
                            "تم الحفظ بنجاح",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w600),
                          )
                        : state is UpdateLodingState
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : state is UpdateerrorState
                                ? SelectableText(
                                    "${error_State}",
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w600),
                                  )
                                : Container(),
                  ],
                ),
                SizedBox(
                  height: 150,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
