
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:medicalApp/medical_model.dart';
import 'package:medicalApp/models/clients/client.dart';

import 'user_card.dart';


Image createImage(BuildContext context,MyClient client) {
  return Image(

  image: AssetImage(client.userProfile.imagePath));
}
class ClientTab extends StatefulWidget {
   final List<MyClient> clientList;
   List<MyClient> searchedClients;
   MyClient client ;
   final MedicalModel model;

  ClientTab( this.client,this.clientList,this.model);

  @override
  _ClientTabState createState() => _ClientTabState();

}

class _ClientTabState extends State<ClientTab> {
  ScrollController _scrollController;
  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    widget.searchedClients = widget.clientList;

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
                      .where((client) => client.userProfile.name.toLowerCase()
                      .contains(RegExp(clientName.toLowerCase()))).toList();
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
                          child: DraggableScrollbar.rrect(
                            backgroundColor: Colors.green,
                            alwaysVisibleScrollThumb: true,
                            controller: _scrollController,
                            child: ListView.separated(
                                controller: _scrollController,

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
                                      leading: Column(
                                        children: [
                                          if(widget.searchedClients[index].isGenerated)
                                          SizedBox(
                                            width:50,
                                            height: 50,
                                            child: FittedBox(
                                              child: DefaultAssetBundle(
                                                  bundle: DefaultAssetBundle.of(context),
                                                  child: createImage(context,widget.searchedClients[index])),
                                            ),
                                          ),
                                          if(!widget.searchedClients[index].isGenerated)
                                            SizedBox(
                                              width: 50,
                                                height: 50,
                                                child: FittedBox(child: widget.searchedClients[index].userProfile.imageWidget))
                                        ],
                                      ),
                                      onTap: (){
                                        widget.model.setClient(widget.searchedClients[index]);

                                      },
                                    ),
                                  );
                                }),
                          ),
                        ),
                        if(widget.model.client!=null)
                          UserCard(widget.model.client,widget.searchedClients,widget.model),

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
