import 'dart:convert';


import 'package:medicalApp/fire_base/func_to_send_images.dart';
import 'package:medicalApp/gloabal_functions/client_company_functioni/genClientCompanies.dart';
import 'package:medicalApp/gloabal_functions/generateClient/genHistory.dart';
import 'package:universal_html/prefer_universal/html.dart' as html;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medicalApp/medical_model.dart';
import 'package:medicalApp/models/clients/myclient.dart';
import 'package:http/http.dart' as http;


class SendToFireBase{
   CollectionReference clientsCollection = FirebaseFirestore.instance.collection('clients');
   CollectionReference hospitalCollection = FirebaseFirestore.instance.collection('hospitals');
   CollectionReference insuranceCollection = FirebaseFirestore.instance.collection('InsuranceCo');

  sendAllCompanyImages(){

      companyLogoMap.forEach((companyMap) async{
        http.Response response= await http.get('assets/${companyMap[companyMap.keys.first][1]}');
        uploadImageFile(html.File([response.bodyBytes],companyMap[companyMap.keys.first][1]),imageName: companyMap[companyMap.keys.first][1]);
      });



  }

   sendAllHospitalImages(){
     hospitalMap.forEach((hospitalMap) async{
       http.Response response= await http.get('assets/${hospitalMap[hospitalMap.keys.first][1]}');
       uploadImageFile(html.File([response.bodyBytes],hospitalMap[hospitalMap.keys.first][1]),imageName: hospitalMap[hospitalMap.keys.first][1]);
     });



   }

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

//class Uploader {
//  FirebaseStorage storage = FirebaseStorage(storageBucket: 'gs://medcare-insurace.appspot.com');
//StorageUploadTask _uploadTask;
////void startUpload(){
////  String filePath = 'images/company_logos/NWSC.jpg';
////  _uploadTask = storage.ref().child('images/company_logos/NWSC.jpg').putFile(File('assets/images/company_logos/NWSC.jpg'));
////
////}
//}