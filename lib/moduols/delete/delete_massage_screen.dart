import 'dart:async';

import 'package:contolpanal_flutter/shear/Cubit/App_cubit.dart';
import 'package:contolpanal_flutter/shear/Cubit/App_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Delete_Massege_Screen extends StatelessWidget {
  const Delete_Massege_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<App_Cubit, App_State>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        App_Cubit cubit = App_Cubit.git(context);

        return Container(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "هل أنت متأكد من أنك تريد الحذف",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.red,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 60,
                      width: 250,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(60)),
                      child: MaterialButton(
                        onPressed: () {
                          cubit.deletecurrantindex_cange(0);
                        },
                        child: Text(
                          "إلغاء الأمر",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Container(
                      height: 60,
                      width: 250,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(60)),
                      child: MaterialButton(
                        onPressed: () {
                          cubit.DeleteDatafromDtabase(
                              id: cubit.id_curruntindex.toString());
                          cubit.deletecurrantindex_cange(0);
                          Timer(Duration(seconds: 1), () {
                            cubit.UpdateDatamethod_show_allData(statuse: "*");
                          });
                          cubit.UpdateDatamethod_show_allData(statuse: "*");
                        },
                        child: Text(
                          "تأكيد الحذف",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
