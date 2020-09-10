import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medicalApp/medical_model.dart';
import 'package:medicalApp/models/clients/myclient.dart';

class SendToFireBase{
   CollectionReference clientsCollection = FirebaseFirestore.instance.collection('clients');
   CollectionReference hospitalCollection = FirebaseFirestore.instance.collection('hospitals');
   CollectionReference insuranceCollection = FirebaseFirestore.instance.collection('InsuranceCo');

   sendClient(MyClient client){

    clientsCollection.doc(client.id).set({'client': json.encode(client.toJson())});

  }
  sendAllClients(MedicalModel model){
    model.clientList.forEach((client) =>sendClient(client));
  }
  sendHospitals(MedicalModel model){
    hospitalCollection.doc('hospital-doc').set({'hospital': json.encode(model.hospitalNameList)});
  }
sendInsuranceCo(MedicalModel model){
    insuranceCollection.doc('insuranceCo-doc').set({'hospital': json.encode(model.insuranceNameList)});
  }

}
