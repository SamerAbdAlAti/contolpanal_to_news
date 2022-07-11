import 'package:contolpanal_flutter/shear/Cubit/App_cubit.dart';
import 'package:contolpanal_flutter/shear/Cubit/App_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget buildbuttom_lift({
  int botton_key = 51454541,
  var icon = Icons.home,
  String box_text = "لوحة التحكم",
  GestureTapCallback? onpress,
}) =>
    BlocConsumer<App_Cubit, App_State>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        App_Cubit cubit = App_Cubit.git(context);
        return GestureDetector(
          onTap: onpress,
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            onHover: (value) {
              cubit.WhatisOn_change(botton_key);
            },
            onExit: (value) {
              cubit.WhatisOn_change(0);
            },
            child: Container(
              height: 60,
              width: double.infinity,
              color: cubit.WhatisOn == botton_key
                  ? Colors.white.withOpacity(0.4)
                  : Colors.black,
              child: Row(
                children: [
                  Icon(
                    icon,
                    size: 60,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Flexible(
                      child: Container(
                          child: Text(
                    "$box_text",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )))
                ],
              ),
            ),
          ),
        );
      },
    );

Widget build_insairtData_field({
  String title = "العنوان العام",
  int maxlins = 1,
  var controlar,
  String hintText = "",
  bool ishavevaledator = true,
  var onTap,
  TextInputType? typ,
}) =>
    Padding(
      padding: const EdgeInsets.only(top: 20, right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "$title",
            style: TextStyle(fontSize: 15),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            onTap: onTap,
            keyboardType: typ,
            controller: controlar,
            textDirection: TextDirection.rtl,
            validator: ishavevaledator
                ? (String? value) {
                    if (value!.isEmpty) {
                      return "هذا الحقل اجباري";
                    }
                  }
                : null,
            maxLines: maxlins,
            decoration: InputDecoration(
              hintText: hintText,
              hintTextDirection: TextDirection.rtl,
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
