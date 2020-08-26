import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:medicalApp/gloabal_functions/generateClient/genHistory.dart';
class HospitalsOverView extends StatefulWidget {
  final List<Map<String,List<String>>> hospitalCollection ;
  List<Map<String,List<String>>>  searchedHospitals;

  HospitalsOverView(this.hospitalCollection);

  @override
  _HospitalsOverViewState createState() => _HospitalsOverViewState();
}

class _HospitalsOverViewState extends State<HospitalsOverView> {


  @override
  void initState() {
    super.initState();
    widget.searchedHospitals = widget.hospitalCollection;
  }
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [
          FractionallySizedBox(
            widthFactor: 0.3,

            child: TextFormField(

              onChanged: (String clientName){
                setState(() {
                  widget.searchedHospitals = widget.hospitalCollection
                      .where((hospital) => hospital[hospital.keys.first][0] .toLowerCase().contains(RegExp(clientName.toLowerCase()))).toList();
                });
              },


              decoration: InputDecoration(
                  icon: Icon(LineAwesomeIcons.search),
                  hintText: 'Search',
                  border: OutlineInputBorder()),

            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.8,
            width: MediaQuery.of(context).size.width*0.8,
            child: ListView.builder(
              itemCount: widget.searchedHospitals.length,
              itemBuilder: (context,index){
                String key = widget.searchedHospitals[index].keys.first;
                List<String> values = widget.searchedHospitals[index][key];
                return ListTile(
                  leading: SizedBox(
                    width: 300,
                    height: 200,
                    child: FittedBox(
                      child: DefaultAssetBundle(bundle: DefaultAssetBundle.of(context),
                          child: Image(image: AssetImage(values[1]))),
                    ),
                  ),
                  title: Text(values[0]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
