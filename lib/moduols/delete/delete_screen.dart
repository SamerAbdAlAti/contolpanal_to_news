import 'dart:async';

import 'package:contolpanal_flutter/shear/Cubit/App_cubit.dart';
import 'package:contolpanal_flutter/shear/Cubit/App_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Delet_Screen extends StatelessWidget {
  const Delet_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<App_Cubit, App_State>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        App_Cubit cubit = App_Cubit.git(context);
        return cubit.deletescreens[cubit.deletcurrantindex];
      },
    );
  }
}

class Buildupdateitem_delet extends StatelessWidget {
  final index;

  const Buildupdateitem_delet({Key? key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<App_Cubit, App_State>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        App_Cubit cubit = App_Cubit.git(context);
        return Padding(
          padding: const EdgeInsets.only(right: 18),
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                cubit.id_curruntindex_change(index['id']);
                cubit.deletecurrantindex_cange(1);
              },
              child: Card(
                child: Container(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 600,
                            child: Text(
                              "${index['titel']}",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width - 580,
                              height: 90,
                              child: Text(
                                "${index['description']}",
                                textAlign: TextAlign.right,
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                              )),
                        ],
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                        ),
                        child: Image.network(
                          "${index['urlToImage']}",
                          fit: BoxFit.cover,
                          errorBuilder: (
                            BuildContext context,
                            Object error,
                            StackTrace? stackTrace,
                          ) =>
                              Container(
                            child: Center(
                              child: Icon(
                                Icons.error_outline,
                                size: 50,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
