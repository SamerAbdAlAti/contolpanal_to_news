import 'dart:async';

import 'package:contolpanal_flutter/shear/Cubit/App_cubit.dart';
import 'package:contolpanal_flutter/shear/Cubit/App_state.dart';
import 'package:contolpanal_flutter/shear/componanats/componants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class InsairtDatascreen extends StatelessWidget {
  const InsairtDatascreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    var formkey = GlobalKey<FormState>();

    return BlocConsumer<App_Cubit, App_State>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        App_Cubit cubit = App_Cubit.git(context);
        return Form(
          key: formkey,
          child: Padding(
            padding: const EdgeInsets.only(top: 50, left: 50, right: 50),
            child: ListView(
              controller: scrollController,
              children: [
                Container(
                    child: build_insairtData_field(
                        maxlins: 2,
                        title: "أدخل العنوان ",
                        controlar: cubit.title_controlar,
                        hintText: "أدخل عنوان الموضوع")),
                Container(
                    child: build_insairtData_field(
                        maxlins: 10,
                        title: "التفاصيل",
                        controlar: cubit.description_controlar,
                        hintText: "أدخل تفاصيل الموضوع")),
                Container(
                    child: build_insairtData_field(
                        maxlins: 2,
                        title: "رابط الموقع",
                        controlar: cubit.Url_controlar,
                        hintText: "أدخل رابط المصدر")),
                Container(
                    child: build_insairtData_field(
                        maxlins: 2,
                        title: "رابط الصورة",
                        controlar: cubit.urlToImage_controlar,
                        hintText: "أدخل رابط الصورة")),
                Container(
                    child: build_insairtData_field(
                        ishavevaledator: false,
                        maxlins: 2,
                        title: "( Optional ) رابط الفيديو ",
                        controlar: cubit.UrlTovieo_controlar,
                        hintText: "رابط الفيديو إن وجد")),
                Container(
                  child: build_insairtData_field(
                      typ: TextInputType.none,
                      maxlins: 1,
                      title: "التاريخ",
                      controlar: cubit.Date_controlar,
                      hintText: "أنقر لإدخال التاريخ",
                      onTap: () {
                        showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime.parse("2030-05-05"))
                            .then((value) {
                          cubit.Date_controlar.text =
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
                          if (formkey.currentState!.validate()) {
                            cubit.PostData_toDatabase();
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
                    state is Sucsees_State ? Text(
                            "تم الحفظ بنجاح",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w600),
                          )
                        : state is Loding_Staate
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : state is error_State
                                ? SelectableText(
                                    "يوجد خطأ ما\nتأكد من اتصالك بالأنترنت",
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.red,
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
