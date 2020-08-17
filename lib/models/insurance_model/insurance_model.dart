class InsuranceClass {
  final String company;
  final String location;
   String iconPath;
   final String description;

  InsuranceClass({this.company, this.location,this.iconPath,this.description});

  List<Map<String,String>> get listProperties =>
     [
       {'Company': company},
       {'Location': location},
       {'Description': description},

     ];
}