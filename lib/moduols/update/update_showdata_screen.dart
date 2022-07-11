import 'package:contolpanal_flutter/moduols/update/updatedata.dart';
import 'package:contolpanal_flutter/shear/Cubit/App_cubit.dart';
import 'package:contolpanal_flutter/shear/Cubit/App_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Update_Show_Data_screen extends StatelessWidget {
  const Update_Show_Data_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<App_Cubit, App_State>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        var scrolcontrolar = ScrollController();
        App_Cubit cubit = App_Cubit.git(context);
        List list = cubit.UpdateAllDatashow['0'];
        return Padding(
          padding: const EdgeInsets.all(15),
          child: ListView.builder(
            controller: scrolcontrolar,
            itemBuilder: (context, index) =>
                Buildupdateitem(index: list[index]),
            itemCount: list.length,
            shrinkWrap: true,
          ),
        );
      },
    );
  }
}
