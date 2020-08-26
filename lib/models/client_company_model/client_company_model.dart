class ClientCompany {
  final String companyName;
  final String location;
   final String iconPath;


  ClientCompany({this.companyName, this.location,this.iconPath});

  List<Map<String,String>> get listProperties =>
     [
       {'Company': companyName},
       {'Location': location},


     ];
}