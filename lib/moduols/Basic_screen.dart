import 'dart:async';

import 'package:contolpanal_flutter/shear/Cubit/App_cubit.dart';
import 'package:contolpanal_flutter/shear/Cubit/App_state.dart';
import 'package:contolpanal_flutter/shear/componanats/componants.dart';
import 'package:contolpanal_flutter/shear/network/local/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Basic_Scareen extends StatelessWidget {
  final screen;

  const Basic_Scareen({Key? key, required this.screen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenhit = MediaQuery.of(context).size.height;
    return BlocConsumer<App_Cubit, App_State>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        App_Cubit cubit = App_Cubit.git(context);
        return Container(
          child: Row(
            children: [
              Container(
                width: 300,
                height: screenhit,
                color: Colors.black,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      //side buttons
                      SizedBox(
                        height: 150,
                      ),

                      Container(
                        child: buildbuttom_lift(
                          botton_key: 5,
                          box_text: "عرض البيانات",
                          onpress: () {
                            Navigator.pushNamed(context,  "/عرض البيانات",arguments: "2");
                            Timer(Duration(milliseconds: 100),(){
                              cubit.GETAllData();
                            });
                          },
                          icon: Icons.slideshow_outlined,
                        ),
                      ),
                      Container(
                        child: buildbuttom_lift(
                            botton_key: 2,
                            box_text: "إضافة بيانات",
                            icon: Icons.add_box_outlined,
                            onpress: () {
                              Navigator.pushNamed(context,  "/إضافة بيانات",arguments: "3");
                            }),
                      ),
                      Container(
                        child: buildbuttom_lift(
                            botton_key: 3,
                            box_text: "تحديث البيانات",
                            icon: Icons.update,
                            onpress: () {
                              Navigator.pushNamed(context, "/تحديث البيانات",arguments: "4");
                            }),
                      ),
                      Container(
                        child: buildbuttom_lift(
                            botton_key: 4,
                            box_text: "حذف بيانات",
                            icon: Icons.delete_forever,
                        onpress: (){
                          Navigator.pushNamed(context,  "/حذف البيانات",arguments: 5);
                        }
                        ),

                      ),

                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  height: screenhit,
                  child: screen,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
