import 'package:flutter/material.dart';
import 'package:medicalApp/gloabal_functions/insurance_func/genInsuranceModel.dart';

import 'package:medicalApp/models/insurance_model/insurance_model.dart';
import 'package:medicalApp/widgets/tabViews/clients/user_tile.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../../medical_model.dart';

Image createInsImage(BuildContext context, InsuranceClass insurance) {
  return Image(image: AssetImage(insurance.iconPath));
}

class InsuranceTab extends StatefulWidget {
  final MedicalModel model;

  InsuranceTab(this.model);

  @override
  _InsuranceTabState createState() => _InsuranceTabState();
}

class _InsuranceTabState extends State<InsuranceTab> {
  final List<InsuranceClass> insuranceList = generateAllInsuranceList();
  List<InsuranceClass> searchedInsuranceList;
  @override
  void initState() {
    super.initState();
    searchedInsuranceList = insuranceList;
  }
  @override
  void dispose() {
    super.dispose();
  }

  //int insurerIndex;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SearchBar(
            onChanged: (String insurerGot) {
              setState(() {
                searchedInsuranceList = insuranceList
                    .where((insurer) => insurer.company
                    .toLowerCase()
                    .contains(RegExp(insurerGot.toLowerCase())))
                    .toList();
              });
            }
        ),

        Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            height: MediaQuery.of(context).size.height * 0.8,
            child: Card(
              elevation: 2,
              child: ListView(
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [

                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 400),
                    child: ListView.builder(
                      physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: searchedInsuranceList.length,
                        itemBuilder: (_, index) {
                          return DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: Colors.grey,
                              ),
                            ),
                            child: SizedBox(
                                width: 300,
                                child: ListTile(
                                  key: Key(searchedInsuranceList[index].company),
                                  onTap: () {
                                    widget.model.setInsurerIndex(index);
                                  },
                                  focusColor: Colors.blue,
                                  hoverColor: Colors.green,
                                  title: Text(' ${searchedInsuranceList[index].company}'),
                                  subtitle:
                                  Text('${searchedInsuranceList[index].location}.'),
                                  leading: DefaultAssetBundle(
                                      bundle: DefaultAssetBundle.of(context),
                                      child: createInsImage(
                                          context, searchedInsuranceList[index])),
                                )),
                          );
//
                        }),
                  ),

                  //TODO: fix the search error when a already selected tile in searched out of view
                  if(widget.model.insurerIndex != null )
                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 400),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            isThreeLine: true,
                            leading: DefaultAssetBundle(
                                bundle: DefaultAssetBundle.of(context),
                                child: createInsImage(
                                    context, searchedInsuranceList[widget.model.insurerIndex])),
                            title: Text(
                                '${searchedInsuranceList[widget.model.insurerIndex].company}',style: TextStyle(fontWeight: FontWeight.bold)),
                            subtitle: Text(
                                '${searchedInsuranceList[widget.model.insurerIndex].location}'),
                          ),
                          Text('Description',style: TextStyle(fontWeight: FontWeight.bold),),
                          Text('${searchedInsuranceList[widget.model.insurerIndex].description}')
                        ],
                      ),
                    )

                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
