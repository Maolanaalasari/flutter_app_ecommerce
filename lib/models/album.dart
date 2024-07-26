import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

Future<List<Album>> fetchAlbums(int pageCount,
    [String queryString = 'cakes']) async {
  String url =
      'https://api.pexels.com/v1/search?query=$queryString&per_page=$pageCount';
  String token = '563492ad6f91700001000001d823a46fa27543d99343990fe281a219';
  final response = await http.get(Uri.parse(url), headers: {
    'Content-Type': 'application/json',
    HttpHeaders.authorizationHeader: token
  });

  if (response.statusCode == 200) {
    Map<String, dynamic> body = jsonDecode(response.body);
    List<dynamic> themesList = body['photos'];
    List<Album> albums =
        themesList.map((json) => Album.fromJson(json)).toList();
    return albums;
  } else {
    throw Exception('Failed to load themes');
  }
}

class Album {
  final int photoId;
  final int width;
  final int height;
  final String url;
  final String photographer;
  final String photographerUrl;
  final int photographerId;
  final Photo photos;

  Album({
    required this.photoId,
    required this.width,
    required this.height,
    required this.url,
    required this.photographer,
    required this.photographerUrl,
    required this.photographerId,
    required this.photos,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      photoId: json['id'],
      width: json['width'],
      height: json['height'],
      url: json['url'],
      photographer: json['photographer'],
      photographerUrl: json['photographer_url'],
      photographerId: json['photographer_id'],
      photos: Photo.fromJson(json['src']),
    );
  }
}

class Photo {
  final String original;
  final String large2x;
  final String large;
  final String medium;
  final String small;
  final String portrait;
  final String landscape;
  final String tiny;

  Photo({
    required this.original,
    required this.large2x,
    required this.large,
    required this.medium,
    required this.small,
    required this.portrait,
    required this.landscape,
    required this.tiny,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      original: json['original'],
      large2x: json['large2x'],
      large: json['large'],
      medium: json['medium'],
      small: json['small'],
      portrait: json['portrait'],
      landscape: json['landscape'],
      tiny: json['tiny'],
    );
  }
}
