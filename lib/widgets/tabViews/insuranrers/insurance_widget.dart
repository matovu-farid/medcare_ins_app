import 'package:flutter/material.dart';
import 'package:medicalApp/gloabal_functions/insurance_func/genInsuranceModel.dart';

import 'package:medicalApp/models/insurance_model/insurance_model.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../../medical_model.dart';

Image createInsImage(BuildContext context, InsuranceClass insurance) {
  return Image(image: AssetImage(insurance.iconPath));
}

class InsuranceTab extends StatelessWidget {
  final MedicalModel model;
  List<InsuranceClass> insuranceList = generateInsuranceList();

  InsuranceTab(this.model);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.6,
        height: MediaQuery.of(context).size.height * 0.8,
        child: Card(
          elevation: 2,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 400),
                child: ListView.separated(
                    shrinkWrap: true,
                    separatorBuilder: (context, index) => Divider(
                      thickness: 3,
                    ),
                    itemCount: insuranceList.length,
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
                              onTap: () {
                                model.setInsurerIndex(index);
                              },
                              focusColor: Colors.blue,
                              hoverColor: Colors.green,
                              title: Text(' ${insuranceList[index].company}'),
                              subtitle:
                              Text('${insuranceList[index].location}.'),
                              leading: DefaultAssetBundle(
                                  bundle: DefaultAssetBundle.of(context),
                                  child: createInsImage(
                                      context, insuranceList[index])),
                            )),
                      );
//
                    }),
              ),
              if(model.insurerIndex != null)
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
                                context, insuranceList[model.insurerIndex])),
                        title: Text(
                            '${insuranceList[model.insurerIndex].company}',style: TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text(
                            '${insuranceList[model.insurerIndex].location}'),
                      ),
                      Text('Description',style: TextStyle(fontWeight: FontWeight.bold),),
                      Text('${insuranceList[model.insurerIndex].description}')
                    ],
                  ),
                )

            ],
          ),
        ),
      ),
    );
  }
}
