import 'package:contolpanal_flutter/moduols/delete/delete_screen.dart';
import 'package:contolpanal_flutter/shear/Cubit/App_cubit.dart';
import 'package:contolpanal_flutter/shear/Cubit/App_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Delete_Show_Data extends StatelessWidget {
  const Delete_Show_Data({Key? key}) : super(key: key);

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
          child: Scrollbar(
            controller: scrolcontrolar,
            isAlwaysShown: true,

            child: ListView.builder(

              itemBuilder: (context, index) =>
                  Buildupdateitem_delet(index: list[index]),
              itemCount: list.length,
              shrinkWrap: true,
            ),
          ),
        );
      },
    );
  }
}
