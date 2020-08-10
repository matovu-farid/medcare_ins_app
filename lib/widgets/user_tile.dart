
import 'package:flutter/material.dart';
import 'package:medicalApp/gloabal_functions/genClient.dart';
import 'package:medicalApp/models/client.dart';


Image createImage(BuildContext context,Client client) {
  return Image(

  image: AssetImage(client.userProfile.imagePath));
}
class UserListView extends StatefulWidget {
  @override
  _UserListViewState createState() => _UserListViewState();
}

class _UserListViewState extends State<UserListView> {
  List<Client> clientList = generateClientList();



  Color heartColor(Client client){
    if(client.userProfile.likability=='Dislike'){
      return ThemeData().splashColor;
    }
    else return Colors.red;
  }




  @override
  Widget build(BuildContext context) {
    return ListView.separated(
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

              title: Text(' ${clientList[index].userProfile.name}'),
              subtitle: Text('${clientList[index].userProfile.company}.'),
              leading: DefaultAssetBundle(
                  bundle: DefaultAssetBundle.of(context),
                  child: createImage(context,clientList[index])),
            ),
          );
        });
  }
}
