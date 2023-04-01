import 'package:gif_service/gif_service.dart';

void main() async {
  final gifServide = GifService();
  final urls = await gifServide.fetchGifs();
  for (final url in urls) {
    print(url);
  }
}
