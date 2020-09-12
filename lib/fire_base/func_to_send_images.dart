import 'dart:async';
import 'package:universal_html/prefer_universal/html.dart' as html;
import 'package:firebase/firebase.dart' as fb;

Future<Uri> uploadImageFile(html.File image,
    {String imageName}) async {
  fb.StorageReference storageRef = fb.storage().ref(imageName);
  fb.UploadTaskSnapshot uploadTaskSnapshot = await storageRef.put(image).future;
  Uri imageUri = await uploadTaskSnapshot.ref.getDownloadURL();
  return imageUri;
}