import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:medicalApp/gloabal_functions/genClient.dart';
import 'package:medicalApp/models/client.dart';
import 'package:mock_data/mock_data.dart';

class Home extends StatelessWidget {
  List<String> names = ['farid', 'jane', 'joe', 'steve'];
  List<Client> clientList = generateClientList();

  Image createImage(BuildContext context) {
    // File file  = File('C:\\Users\\Sarah\\Desktop\\medcareInsApp\\medicalApp\\assets\\images\\profile_images\\1.jpg');
    //return  Image.file(file);
    return Image(
        image: AssetImage('images/profile_images/${mockInteger(1, 9)}.jpg'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MedCare"),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: ListView.separated(
              separatorBuilder: (BuildContext context, int index) => Divider(
                    thickness: 3,
                  ),
              itemCount: clientList.length,
              itemBuilder: (_, index) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  child: ListTile(
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(LineAwesomeIcons.heart),
                        ),
                        IconButton(
                          icon: Icon(LineAwesomeIcons.trash),
                        ),
                        IconButton(
                          icon: Icon(LineAwesomeIcons.alternate_share),
                        ),
                        IconButton(
                          icon: Icon(LineAwesomeIcons.remove_user),
                        ),

                      ],
                    ),
                    focusColor: Colors.blue,
                    hoverColor: Colors.green,
                    title: Text(' ${clientList[index].userProfile.name}'),
                    subtitle: Text('${clientList[index].userProfile.company}.'),
                    leading: DefaultAssetBundle(
                        bundle: DefaultAssetBundle.of(context),
                        child: createImage(context)),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
