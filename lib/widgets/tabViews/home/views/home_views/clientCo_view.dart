import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:medicalApp/gloabal_functions/insurance_func/genInsuranceModel.dart';


class ClientCompanyOverView extends StatefulWidget {
  final List<Map<String,List<String>>> clientCoCollection ;
  List<Map<String,List<String>>>   searchedClientCo;

  ClientCompanyOverView(this.clientCoCollection);

  @override
  _ClientCompanyOverViewState createState() => _ClientCompanyOverViewState();
}

class _ClientCompanyOverViewState extends State<ClientCompanyOverView> {
  @override
  void initState() {
    super.initState();
    widget.searchedClientCo = widget.clientCoCollection;
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
                  widget.searchedClientCo = widget.clientCoCollection
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
            width: MediaQuery.of(context).size.width*0.8,
            height: MediaQuery.of(context).size.height *0.8,
            child: ListView.builder(
              itemCount: widget.searchedClientCo.length,
              itemBuilder: (context,index){
                String key = widget.searchedClientCo[index].keys.first;
                List<String> values = widget.searchedClientCo[index][key];
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
