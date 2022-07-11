import 'package:contolpanal_flutter/layout/home_layout.dart';
import 'package:contolpanal_flutter/shear/Cubit/App_cubit.dart';
import 'package:contolpanal_flutter/shear/Cubit/App_state.dart';
import 'package:contolpanal_flutter/shear/Cubit/blocobserver.dart';
import 'package:contolpanal_flutter/shear/network/local/dio_helper.dart';
import 'package:contolpanal_flutter/shear/style/style.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{

  await Dio_helper.init();

  BlocOverrides.runZoned(
        () {
      // Use cubits...
          runApp(MyApp());

          App_Cubit();
    },
    blocObserver: MyBlocObserver(),
  );


}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) =>App_Cubit()..GETAllData()..UpdateDatamethod_show_allData(statuse: '*')..UpdateDatamethod_show_allData(statuse: 'id'),)
      ],
      child: BlocConsumer<App_Cubit,App_State>(

        listener: (BuildContext context, state) {  },
        builder: (BuildContext context, Object? state) {
          App_Cubit cubit=App_Cubit.git(context);
          return  MaterialApp(
            title: 'Control banal',
            theme: App_Style.Light_theme,
            darkTheme: App_Style.Dark_theme,
            initialRoute: "/عرض البيانات",
            routes: {

              "/عرض البيانات":(context)=>Home_Layout(screen: cubit.center_screens[cubit.currentindex_ShowDataFreomDatabase]),
              "/إضافة بيانات":(context)=>Home_Layout(screen: cubit.center_screens[3]),
              "/تحديث البيانات":(context)=>Home_Layout(screen: cubit.center_screens[4]),
              "/حذف البيانات":(context)=>Home_Layout(screen: cubit.center_screens[5]),




            },
          );
        },

      ),
    );
  }
}
