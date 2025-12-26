class Message {
  String? body;
  bool? isSender;

  Message({this.body, this.isSender = false});

  Message.fromJson(Map<String, dynamic> json) {
    body = json['body'];
  }
}
