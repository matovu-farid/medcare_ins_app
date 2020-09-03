import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:medicalApp/medical_model.dart';
import 'package:medicalApp/models/clients/client.dart';

import 'user_card.dart';

Image createImage(BuildContext context, MyClient client) {
  return Image(image: AssetImage(client.userProfile.imagePath));
}

class UserTileListView extends StatefulWidget {
  final List<MyClient> clientList;
  List<MyClient> searchedClients;
  MyClient client;

  final MedicalModel model;

  UserTileListView(this.client, this.clientList, this.model);

  @override
  _UserTileListViewState createState() => _UserTileListViewState();
}

class _UserTileListViewState extends State<UserTileListView> {
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
              onChanged: (String clientName) {
                setState(() {
                  widget.searchedClients = widget.clientList
                      .where((client) => client.userProfile.name
                          .toLowerCase()
                          .contains(RegExp(clientName.toLowerCase())))
                      .toList();
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
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.8,
              child: Card(
                elevation: 2,
                child: TileList(
                  scrollController: _scrollController,
                  searchedClients: widget.searchedClients,
                  model: widget.model,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TileList extends StatelessWidget {
  const TileList(
      {Key key,
        this.disableTap = false,
      @required this.scrollController ,
      @required this.searchedClients,
      @required this.model})
      :
        super(key: key);

  final ScrollController scrollController;
  final List<MyClient> searchedClients;
  final MedicalModel model;
  final bool disableTap;

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                  maxWidth: 400, maxHeight: MediaQuery.of(context).size.height),
              child: DraggableScrollbar.rrect(
                key: Key('smallerScrollBar'),
                backgroundColor: Colors.grey,
                alwaysVisibleScrollThumb: true,
                controller: scrollController,
                child: ListView.separated(
                    controller: scrollController,
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(
                          thickness: 3,
                        ),
                    itemCount: searchedClients.length,
                    itemBuilder: (_, index) {
                      return DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Colors.grey,
                          ),
                        ),
                        child: UserTile(
                          index: index,
                          searchedClients: searchedClients,
                          model: model,
                          disableTap: disableTap,
                        ),
                      );
                    }),
              ),
            ),
            if (model.client != null)
              UserCard(model.client, searchedClients, model),
          ],
        ),
      ],
    );
  }
}

class UserTile extends StatelessWidget {
  const UserTile(
      {Key key,
      @required this.index,
      @required this.searchedClients,
      @required this.model,
        this.disableTap=false})
      : super(key: key);

  final int index;
  final List<MyClient> searchedClients;
  final MedicalModel model;
  final bool disableTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(' ${searchedClients[index].userProfile.name}'),
      subtitle:
          Text('${searchedClients[index].userProfile.company.companyName}.'),
      leading: Column(
        children: [
          if (searchedClients[index].isGenerated)
            SizedBox(
              width: 50,
              height: 50,
              child: FittedBox(
                child: DefaultAssetBundle(
                    bundle: DefaultAssetBundle.of(context),
                    child: createImage(context, searchedClients[index])),
              ),
            ),
          if (!searchedClients[index].isGenerated)
            SizedBox(
                width: 50,
                height: 50,
                child: FittedBox(
                    child: searchedClients[index].userProfile.imageWidget))
        ],
      ),
      onTap: () {
        if(!disableTap)
        model.setClient(searchedClients[index]);
      },
    );
  }
}
