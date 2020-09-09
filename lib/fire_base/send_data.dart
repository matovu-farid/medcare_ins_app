import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medicalApp/medical_model.dart';
import 'package:medicalApp/models/clients/client.dart';

class SendClient{
   CollectionReference clientsCollection = FirebaseFirestore.instance.collection('clients');
  sendClient(MyClient client){
    clientsCollection.doc(client.id).set({'client':client.toString()});

//clientsCollection.add({'entry 1':model.clientList.first.toString()});
  }
  sendAllClients(MedicalModel model){
    model.clientList.forEach((client) =>sendClient(client));
  }
}
