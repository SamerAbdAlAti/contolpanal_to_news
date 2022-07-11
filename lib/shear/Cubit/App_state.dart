abstract class App_State{}

class App_inatualState extends App_State{}
class WhatisOn_change_State extends App_State{}
class currentindex_change_State extends App_State{}
class Loding_Staate extends App_State{}
class Sucsees_State extends App_State{}
class error_State extends App_State{
  final String error;
  error_State(this.error);
}

class routsName_change_State extends App_State{}
class GETAllData_sucsses_State extends App_State{}
class GETDATALodingState extends App_State{}
class GETDATAerrorState extends App_State{
  final String error;
  GETDATAerrorState(this.error);
}

class UpdateData_sucsses_State extends App_State{}
class UpdateData_sucsses_State_id extends App_State{}
class UpdateLodingState extends App_State{}
class UpdateData_sucsses_State_update extends App_State{}
class UpdateerrorState extends App_State{
  final String error;
  UpdateerrorState(this.error);
}

class updatecurrantindex_cange_State extends App_State{}
class deletecurrantindex_cange_State extends App_State{}
class DeleteDatafromDtabase_State extends App_State{}
class DeleteDatafromDtabase_error_State extends App_State{
  final String error;

  DeleteDatafromDtabase_error_State(this.error);
}

class id_curruntindex_change_State extends App_State{}
class updateData_tofunction_State extends App_State{}
class currentindex_ShowDataFreomDatabase_change_State extends App_State{}


