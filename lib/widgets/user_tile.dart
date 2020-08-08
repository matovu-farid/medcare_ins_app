import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:medicalApp/gloabal_functions/genClient.dart';
import 'package:medicalApp/models/client.dart';
import 'package:mock_data/mock_data.dart';

Image createImage(BuildContext context,Client client) {
  return Image(
//      image: AssetImage('images/profile_images/${mockInteger(1, 9)}.jpg'));
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

   tapHeart(Client client){
     if(client.userProfile.likability=='DisLike')client.userProfile.likability='Like';
     else client.userProfile.likability='DisLike';
     setState(() {

     });
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
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    color: heartColor(clientList[index]),
                    onPressed: ()=>tapHeart(clientList[index]),

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
                  child: createImage(context,clientList[index])),
            ),
          );
        });
  }
}
