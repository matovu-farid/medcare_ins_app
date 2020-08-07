import 'package:medicalApp/models/benefits.dart';
import 'package:medicalApp/models/history.dart';
import 'package:medicalApp/models/user_profile.dart';

class Client{
  final Benefits benefits;
  final History history;
  final UserProfile userProfile;

  Client({this.benefits,  this.history, this.userProfile});

  @override
  String toString() {
    return 'Client{benefits: $benefits, history: $history, userProfile: $userProfile}';
  }
}