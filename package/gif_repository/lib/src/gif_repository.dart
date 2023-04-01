import 'package:gif_repository/src/models/models.dart';
import 'package:gif_service/gif_service.dart';

/// {@template gif_repository}
/// gifs repositorio
/// {@endtemplate}
class GifRepository {
  /// {@macro gif_repository}
  GifRepository({GifService? gifService})
      : _gifService = gifService ?? GifService();

  final GifService _gifService;
  Future<List<GifModel>> getUrls() async {
    final urls = <GifModel>[];

    try {
      final listUrls = await _gifService.fetchGifs();
      for (final url in listUrls) {
        urls.add(GifModel(url));
      }
      return urls;
    } catch (e) {
      throw Exception();
    }
  }
}
