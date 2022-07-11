import 'package:contolpanal_flutter/shear/Cubit/App_cubit.dart';
import 'package:contolpanal_flutter/shear/Cubit/App_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowDataFreomDatabase extends StatelessWidget {
  var ScrollControlar = ScrollController();

  ShowDataFreomDatabase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<App_Cubit, App_State>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, Object? state) {
          App_Cubit cubit = App_Cubit.git(context);
          var list = cubit.GETAllDataFromDatabase['0'];
          return Padding(
            padding: const EdgeInsets.all(20),
            child: ListView.separated(
                controller: ScrollControlar,



                shrinkWrap: true,
                itemBuilder: (context, index) => buildonshowitem(list[index]),
                separatorBuilder: (context, index) => Container(),
                itemCount: list.length),
          );
        });
  }
}

Widget buildonshowitem(index) => BlocConsumer<App_Cubit, App_State>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        App_Cubit cubit = App_Cubit.git(context);
        return Padding(
          padding: const EdgeInsets.only(right: 20, left: 10, bottom: 20),
          child: Card(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Container(
                  height: 500,
                  width: 500,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
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
                          size: 70,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(50),
                  child: Row(
                    children: [
                      Expanded(flex: 1,
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                child: Text(
                                  '${index['titel']}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                    color: const Color(0xff000000),
                                  ),
                                  textAlign: TextAlign.right,
                                  softWrap: true,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                  width: MediaQuery.of(context).size.width - 500,
                                  child: Text(
                                    "${index['description']}",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: const Color(0xff000000),
                                    ),
                                  )),
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                "${index['Date']}",
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 60,
                  width: 250,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(60)),
                  child: Container(
                    child: MaterialButton(
                      onPressed: () {
                        cubit.openlink(path: "${index['Url']}");
                      },
                      child: Text(
                        "الإنتقال الى الصفحة",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 200,
                ),
              ],
            ),
          ),
        );
      },
    );
