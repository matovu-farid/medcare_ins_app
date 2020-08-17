import 'package:medicalApp/models/settings/settings.dart';
import 'package:mock_data/mock_data.dart';

Settings generateSettings(){
return Settings(
  name: '${mockName()} ${mockName()}',
  password: '${mockName()}${mockInteger(1,999)}',
    imagePath: 'images/profile_pic/faris.jpg'
);
}