import 'package:http/http.dart' as http;
import "dart:convert";

class Destination {
  final String destinationName;
  final String destinationThumbnail;
  // Vì ở trong data trả về, name là một object nên ta phải tạo một class Name để lưu trữ
  final double destinationRating;

  Destination({
    required this.destinationName,
    required this.destinationThumbnail,
    required this.destinationRating,
  });
  factory Destination.fromJson(Map<String, dynamic> json) {
    return Destination(
      destinationName: json['destinationName'],
      destinationThumbnail: json['destinationThumbnail'],
      destinationRating: json['destinationRating'],
    );
  }
}

// Trong này là các thể loại hàm để GET POST PUT DELETE, nhưng mà hiện tại tôi mới làm GET thôi
class DestinationService {
  Future<List<Destination>> getDestinations() async {
    final response =
        await http.get(Uri.parse('http://localhost:8080/destination'));
    if (response.statusCode == 200) {
      // Cách 1:
      final parsed = jsonDecode(response.body);
      final results = parsed['results'];
      return results
          .map<Destination>((json) => Destination.fromJson(json))
          .toList();
      // Cách 2:
      /*
      final List<User> list = [];
      for (var user in results) {
        list.add(User.fromJson(user));
      }
      return list;
       */
    } else {
      throw Exception('Failed to load users');
    }
  }
}
