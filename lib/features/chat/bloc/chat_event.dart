abstract class ChatEvent {}

class SendMessageEvent extends ChatEvent {
  SendMessageEvent();
}

class ReceiveMessageEvent extends ChatEvent {
  final String message;
  ReceiveMessageEvent(this.message);
}
