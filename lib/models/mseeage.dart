import 'package:chattapp/constant.dart';

class Message1 {
  final String message;
  final String id;
  
  Message1(this.message, this.id);
  factory Message1.fromJson(jsonData) {
    return Message1(jsonData[kMessage], jsonData[kID]);
  }
}
