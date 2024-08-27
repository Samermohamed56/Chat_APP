import 'package:bloc/bloc.dart';
import 'package:chattapp/models/mseeage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
final CollectionReference _messages =
      FirebaseFirestore.instance.collection('messages');
       List<Message1> messagesList = [];
void sendMessage({required String messages,required String email})
{
   _messages.add({
      'text': messages,
      'createdAt': DateTime.now(),
      'id': email,
    });
}
void getMessages()
{
  
_messages.orderBy('createdAt', descending: true).snapshots().listen((event) {
messagesList.clear();
 for (var element in event.docs) {
   messagesList.add(Message1.fromJson(element));
 }

  emit(ChatSuccess(messagesList: messagesList));

},);
}
}
