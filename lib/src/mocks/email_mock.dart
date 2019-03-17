import '../models/email.dart';

class EmailMock extends Email {
  static List<Email> fetchAll() {
    return [
      Email(message: 'This is the first message', title: 'Title 1'),
      Email(message: 'This is the second message', title: 'Title 2'),
      Email(message: 'This is awesome', title: 'Title 3'),
      Email(message: 'Good news', title: 'Title 4'),
      Email(message: 'You got a new message', title: 'Title 5'),
      Email(message: 'You have a new gift', title: 'Title 6'),
      Email(message: 'I got a new friend', title: 'Title 7'),
      Email(message: 'I can not wait to see you', title: 'Title 8'),
    ];
  }
}
