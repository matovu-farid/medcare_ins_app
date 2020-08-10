import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:medicalApp/gloabal_functions/genClient.dart';
import 'package:medicalApp/models/client.dart';
import 'package:medicalApp/widgets/userOptions/benefits_button.dart';
import 'package:medicalApp/widgets/userOptions/card_button.dart';
import 'package:medicalApp/widgets/userOptions/history_button.dart';
import 'package:medicalApp/widgets/userOptions/user_button.dart';
class UserCard extends StatefulWidget {
  Client client = generateClientList()[0];
  @override
  _UserCardState createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  Image createImage(BuildContext context,Client client) {
    return Image(


        image: AssetImage(client.userProfile.imagePath));
  }
  TextStyle setTextStyle(){
    return (widget.client.userProfile.holderStatus=='Card Holder')?
        TextStyle(color: Colors.green,backgroundColor: Colors.green[100])
        :        TextStyle(color: Colors.red,backgroundColor: Colors.red[100]);
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.grey[700],
      elevation: 3,


      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(icon: Icon(LineAwesomeIcons.edit)),
                IconButton(icon: Icon(LineAwesomeIcons.trash),),

              ],
            ),
            isThreeLine: true,
            title: Text(' ${widget.client.userProfile.name}'),
            subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('${widget.client.userProfile.company}.'),
                Text('${widget.client.userProfile.holderStatus}.',
                  style: setTextStyle(),
                ),

              ],
            ),

            leading: createImage(context,widget.client),
          ),
           Align(
             alignment: Alignment.centerLeft,
               child: Text(

                   'Reg Date : ${widget.client.userProfile.regDate}'
               ,style: TextStyle(color: Colors.grey),)),
                     ButtonBar(
                       buttonTextTheme: ButtonTextTheme.accent,
                       children: <Widget>[
                         ProfileButton(),
                       BenefitsButton(),
                       CardButton(),
                       HistoryButton(),


                       ],
                     ),
        ],
      ),
    );
  }
}






