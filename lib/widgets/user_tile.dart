
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medicalApp/gloabal_functions/genClient.dart';
import 'package:medicalApp/models/client.dart';
import 'package:medicalApp/widgets/user_card.dart';


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
  Client client ;



  Color heartColor(Client client){
    if(client.userProfile.likability=='Dislike'){
      return ThemeData().splashColor;
    }
    else return Colors.red;
  }




  @override
  Widget build(BuildContext context) {
    return OverflowBox(
      maxWidth: double.infinity,

      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 400,
              maxHeight: MediaQuery.of(context).size.height
            ),
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
                      title: Text(' ${clientList[index].userProfile.name}'),
                      subtitle: Text('${clientList[index].userProfile.company}.'),
                      leading: DefaultAssetBundle(
                          bundle: DefaultAssetBundle.of(context),
                          child: createImage(context,clientList[index])),
                      onTap: (){
                        setState(() {
                          client = clientList[index];
                        });

                      },
                    ),
                  );
                }),
          ),
          Builder(
              builder: (_){
                if(client!=null){
                  return UserCard(client,clientList);
                }else return SizedBox(height:0,width: 0);
              }
          )
        ],
      ),
    );
  }
}
