import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../medical_model.dart';


class Login extends StatelessWidget {
  static TextEditingController _controller = TextEditingController();
  static TextEditingController _passwordController = TextEditingController();
  static String _textEntered = "";
  var formKey = GlobalKey<FormState>();

  void onPressed(BuildContext context) {
    Navigator.of(context).pushNamed("Home");
  }

  static String getText() {
    _textEntered = _controller.text;
    return _textEntered;
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
          accentColor: Colors.yellow,
        primaryColor: Colors.green,

      ),
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Login")),
        ),
        body: Container(
          padding: EdgeInsets.all(32.0),
          child: Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width*0.4,
              height: MediaQuery.of(context).size.height,
              child: FittedBox(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width*0.4,
                  child: Column(
                    children: <Widget>[
                      Text("Login",style: TextStyle(
                          fontStyle: FontStyle.italic,
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                      ),),
                      Form(
                        key: formKey,
                        child: Column(
                          children: <Widget>[
                            TextFormField(

                              controller: _controller,
                              decoration: InputDecoration(
                                icon: Icon(LineAwesomeIcons.user_1,color: Colors.blue,),
                                labelText: "UserName",
                              ),
                            ),
                            TextFormField(
                                obscureText: true,
                                controller: _passwordController,
                                decoration: InputDecoration(
                                  icon: Icon(LineAwesomeIcons.lock,color: Colors.blue),
                                  labelText: "Password",
                                )),
                          ],
                        ),
                      ),
                      RaisedButton(
                        color: Colors.blue,
                          child: Text("Login",style: TextStyle(color: Colors.white),),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(15))),

                          onPressed: () {
                            formKey.currentState.save();
                            Navigator.of(context).pushNamed("PicScreen",
                                arguments: {"textValue": getText()});
                          }),
                      Row(

                        children: [
                          ScopedModelDescendant<MedicalModel>(
                            builder: (context, child,model) {
                              return LimitedBox(
                                maxWidth: 200,
                                child: CheckboxListTile(
                                  title: Text('Remember me',
                                      style: TextStyle(
                                          color: Colors.blue
                                      )), onChanged: model.setRememberMe, value: model.rememberMe,
                                ),
                              );
                            }
                          ),
                          Text('Forgot Password?',
                            style: TextStyle(
                            color: Colors.blue
                          ),)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

