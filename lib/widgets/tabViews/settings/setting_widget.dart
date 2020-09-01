import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:medicalApp/gloabal_functions/generateSettings/genSettings.dart';
import 'package:medicalApp/medical_model.dart';
import 'package:medicalApp/models/settings/settings.dart';
import 'package:scoped_model/scoped_model.dart';
class SettingsTab extends StatefulWidget {
final MedicalModel model;

SettingsTab(this.model);

  @override
  _SettingsTabState createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  Settings settings = generateSettings();
  TextEditingController controller;
  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text:'${settings.password}');
  }
  Image getImage(Settings settings,BuildContext context){
    return Image(image: AssetImage(settings.imagePath),);
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width *  0.8,
        height: MediaQuery.of(context).size.height *0.9,
        child: Card(
          elevation: 2,
          child: FractionallySizedBox(
            widthFactor: 0.8,
            child: ListView(
              shrinkWrap: true,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 200,
                        height: 200,
                        child: DefaultAssetBundle(
                          bundle: DefaultAssetBundle.of(context),
                            child: getImage(settings,context)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('${settings.name}'),
                    ),

                  ],
                ),
                Text('Account Settings',style: TextStyle(fontWeight: FontWeight.bold),),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Change Password'),
                ),
                ListTile(title: TextField(obscureText: widget.model.obsureAdminPassword,controller: controller,)
                  ,trailing: IconButton(icon:Icon(LineAwesomeIcons.eye),onPressed: ()=>widget.model.setObscureAdminPassword(),),

                )],
            ),
          ),
        ),
      ),
    );
  }
}
