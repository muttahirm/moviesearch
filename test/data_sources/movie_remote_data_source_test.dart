import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:moviesearch/core/error/error.dart';
import 'package:moviesearch/data/data_source/data.source.dart';

import 'movie_remote_data_source_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late MovieRemoteDataSource dataSource;
  late MockClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockClient();
    dataSource = MovieRemoteDataSourceImpl(client: mockHttpClient);
  });

  const String tQuery = "Avengers";

  const String tUrl =
      "https://api.themoviedb.org/3/trending/movie/day?language=en-US&api_key=ea17a4597efff89db3eee641bad4ce56";

  const String pUrl =
      "https://api.themoviedb.org/3/movie/popular?api_key=ea17a4597efff89db3eee641bad4ce56";

  const String sUrl =
      "https://api.themoviedb.org/3/search/movie?query=$tQuery&api_key=ea17a4597efff89db3eee641bad4ce56";

  const String sampleApiResponse = '''
{
  "page": 1,
  "results": [
    {
      "adult": false,
      "backdrop_path": "/path.jpg",
      "id": 1,
      "title": "Sample Movie",
      "original_language": "en",
      "original_title": "Sample Movie",
      "overview": "Overview here",
      "poster_path": "/path2.jpg",
      "media_type": "movie",
      "genre_ids": [1, 2, 3],
      "popularity": 100.0,
      "release_date": "2020-01-01",
      "video": false,
      "vote_average": 7.5,
      "vote_count": 100
    }
  ],
  "total_pages": 1,
  "total_results": 1
}
''';

  test('should perform a GET request on a url to get a movie', () async {
    // arrange
    when(mockHttpClient.get(Uri.parse(sUrl)))
        .thenAnswer((_) async => http.Response(sampleApiResponse, 200));
    // act
    await dataSource.searchMovies(tQuery);
    // assert
    verify(mockHttpClient.get(Uri.parse(sUrl)));
  });

  test('should throw a ServerException when the response code is 404',
      () async {
    // arrange
    when(mockHttpClient.get(any))
        .thenAnswer((_) async => http.Response("Something went wrong", 404));
    // act
    call() => dataSource.searchMovies(tQuery);
    // assert
    expect(() => call(), throwsA(isA<ServerException>()));
  });
}
