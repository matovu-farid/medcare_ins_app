import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medicalApp/medical_model.dart';
import 'package:medicalApp/models/clients/myclient.dart';

class SendClient{
   CollectionReference clientsCollection = FirebaseFirestore.instance.collection('clients');
  sendClient(MyClient client){

    clientsCollection.doc(client.id).set({'client': json.encode(client.toJson())});

  }
  sendAllClients(MedicalModel model){
    model.clientList.forEach((client) =>sendClient(client));
  }
}
