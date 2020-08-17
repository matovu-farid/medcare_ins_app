
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medicalApp/models/clients/client.dart';

import 'user_card.dart';


Image createImage(BuildContext context,Client client) {
  return Image(

  image: AssetImage(client.userProfile.imagePath));
}
class ClientTab extends StatefulWidget {
  final List<Client> clientList;
   Client client ;

  ClientTab( this.client,this.clientList);

  @override
  _ClientTabState createState() => _ClientTabState();

}

class _ClientTabState extends State<ClientTab> {




  Color heartColor(Client client){
    if(client.userProfile.likability=='Dislike'){
      return ThemeData().splashColor;
    }
    else return Colors.red;
  }




  @override
  Widget build(BuildContext context) {
    return Center(

      child: SizedBox(
        width: MediaQuery.of(context).size.width *0.8,
        height: MediaQuery.of(context).size.height * 0.8,
        child: Card(
          elevation: 2,
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: [
              Row(
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
                        itemCount: widget.clientList.length,
                        itemBuilder: (_, index) {
                          return DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: Colors.grey,
                              ),
                            ),
                            child: ListTile(
                              title: Text(' ${widget.clientList[index].userProfile.name}'),
                              subtitle: Text('${widget.clientList[index].userProfile.company}.'),
                              leading: DefaultAssetBundle(
                                  bundle: DefaultAssetBundle.of(context),
                                  child: createImage(context,widget.clientList[index])),
                              onTap: (){
                                setState(() {
                                  widget.client = widget.clientList[index];
                                });

                              },
                            ),
                          );
                        }),
                  ),
                  Builder(
                      builder: (_){
                        if(widget.client!=null){
                          return UserCard(widget.client,widget.clientList);
                        }else return SizedBox(height:0,width: 0);
                      }
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
