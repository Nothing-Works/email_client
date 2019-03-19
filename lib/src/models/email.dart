class Email {
  final String message;
  final String title;

  Email({this.message, this.title});

  Email.fromJson(Map<String, dynamic> json)
      : message = json['message'],
        title = json['title'];
}
