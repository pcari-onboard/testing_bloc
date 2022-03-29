import 'package:http/http.dart';

abstract class ApiHelperInterface {
  factory ApiHelperInterface({required bool isStaging}) {
    if (isStaging) {
      return ApiHelper.staging();
    }
    return ApiHelper.production();
  }

  Client get getClient;
  Uri getUri({
    required String path,
  });
  Future<Response> postMethod({
    required String path,
    required Map<String, dynamic> payload,
  });
  Future<Response> getMethod({
    required String path,
  });
  Future<Response> putMethod({
    required String path,
    required Map<String, dynamic> payload,
  });
  Future<Response> deleteMethod({
    required String path,
    Map<String, dynamic>? payload,
  });
}

class ApiHelper implements ApiHelperInterface {
  final String baseUrl;
  final String apiVersion;

  ApiHelper({
    required this.baseUrl,
    required this.apiVersion,
  });

  factory ApiHelper.staging() {
    return ApiHelper(
      baseUrl: "https://reqres.in",
      apiVersion: "/api",
    );
  }

  factory ApiHelper.production() {
    return ApiHelper(
      baseUrl: "https://reqres.in",
      apiVersion: "/api",
    );
  }

  @override
  Client get getClient {
    Client client = Client();
    return client;
  }

  @override
  Uri getUri({required String path}) {
    String url = baseUrl + apiVersion + path;
    Uri uri = Uri.parse(
      url,
    );
    return uri;
  }

  @override
  Future<Response> deleteMethod({
    required String path,
    Map<String, dynamic>? payload,
  }) async {
    Client client = getClient;
    Response response = await client.delete(
      getUri(
        path: path,
      ),
      body: payload,
    );
    return response;
  }

  @override
  Future<Response> getMethod({required String path}) async {
    Client client = getClient;
    Response response = await client.get(
      getUri(
        path: path,
      ),
    );
    return response;
  }

  @override
  Future<Response> postMethod({
    required String path,
    required Map<String, dynamic> payload,
  }) async {
    Client client = getClient;
    Response response = await client.post(
      getUri(
        path: path,
      ),
      body: payload,
    );
    return response;
  }

  @override
  Future<Response> putMethod({
    required String path,
    required Map<String, dynamic> payload,
  }) async {
    Client client = getClient;
    Response response = await client.put(
      getUri(
        path: path,
      ),
      body: payload,
    );
    return response;
  }
}
