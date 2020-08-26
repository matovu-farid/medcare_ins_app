
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:medicalApp/models/clients/client.dart';

import 'user_card.dart';


Image createImage(BuildContext context,Clients client) {
  return Image(

  image: AssetImage(client.userProfile.imagePath));
}
class ClientTab extends StatefulWidget {
   final List<Clients> clientList;
   List<Clients> searchedClients;
   Clients client ;

  ClientTab( this.client,this.clientList);

  @override
  _ClientTabState createState() => _ClientTabState();

}

class _ClientTabState extends State<ClientTab> {

  @override
  void initState() {
    super.initState();
    widget.searchedClients = widget.clientList;
  }
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return SizedBox(
       height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          FractionallySizedBox(
            widthFactor: 0.3,

            child: TextFormField(

              onChanged: (String clientName){
                setState(() {
                  widget.searchedClients = widget.clientList
                      .where((client) => client.userProfile.name.toLowerCase().contains(RegExp(clientName.toLowerCase()))).toList();
                });
              },


              decoration: InputDecoration(
                icon: Icon(LineAwesomeIcons.search),
                  hintText: 'Search',
                  border: OutlineInputBorder()),

            ),
          ),
          Center(

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
                              itemCount: widget.searchedClients.length,
                              itemBuilder: (_, index) {
                                return DecoratedBox(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  child: ListTile(
                                    title: Text(' ${widget.searchedClients[index].userProfile.name}'),
                                    subtitle: Text('${widget.searchedClients[index].userProfile.company.companyName}.'),
                                    leading: DefaultAssetBundle(
                                        bundle: DefaultAssetBundle.of(context),
                                        child: createImage(context,widget.searchedClients[index])),
                                    onTap: (){
                                      setState(() {
                                        widget.client = widget.searchedClients[index];
                                      });

                                    },
                                  ),
                                );
                              }),
                        ),
                        Builder(
                            builder: (_){
                              if(widget.client!=null){
                                return UserCard(widget.client,widget.searchedClients);
                              }else return SizedBox(height:0,width: 0);
                            }
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
