import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:reto_tecnico/src/rest/resultado_state.dart';

import '../../my_app.dart';
import '../utils/constants.dart';
import 'config.dart';

class RestApi {
  late Map<String, String> headers;
  late String baseUrl;

  RestApi() {
    baseUrl = (DEFINE_ENVIRONMENT == "dev") ? baseUrlDev : baseUrlProd;

    headers = {"Content-type": "application/json"};
  }

  //Create GET
  Future<ResultadoState> createGET(
      {required String path, Map<String, dynamic>? queryParams}) async {
    String queryString = (queryParams != null)
        ? "?${Uri(queryParameters: queryParams).query}"
        : "";

    var url = Uri.parse(baseUrl + path + queryString);

    final resp = await http.get(url, headers: headers);
    if (kDebugMode) MyApp.alice.onHttpResponse(resp);

    return processResponse(resp: resp, path: path, action: "GET");
  }

  //Create POST
  Future<ResultadoState> createPOST(
      {required String path, required Map<dynamic, dynamic> body}) async {
    var url = Uri.parse(baseUrl + path);

    final resp = await http.post(url, headers: headers, body: jsonEncode(body));
    if (kDebugMode) MyApp.alice.onHttpResponse(resp, body: body);

    return processResponse(resp: resp, path: path, action: "POST", body: body);
  }

  //Create PUT
  Future<ResultadoState> createPUT({
    required String path,
    required Map<dynamic, dynamic> body,
  }) async {
    var url = Uri.parse(baseUrl + path);

    final resp = await http.put(url, headers: headers, body: jsonEncode(body));
    if (kDebugMode) MyApp.alice.onHttpResponse(resp, body: body);

    return processResponse(resp: resp, path: path, action: "PUT", body: body);
  }

  //Create DELETE
  Future<ResultadoState> createDELETE(
      {required String path, required Map<dynamic, dynamic> body}) async {
    var url = Uri.parse(baseUrl + path);
    final resp = await http.delete(url, headers: headers);
    if (kDebugMode) MyApp.alice.onHttpResponse(resp, body: body);

    return processResponse(
        resp: resp, path: path, action: "DELETE", body: body);
  }

  //Create PATCH
  Future<ResultadoState> createPATCH({
    required String path,
    required Map<dynamic, dynamic> body,
  }) async {
    var url = Uri.parse(baseUrl + path);
    final resp =
        await http.patch(url, headers: headers, body: jsonEncode(body));
    if (kDebugMode) MyApp.alice.onHttpResponse(resp, body: body);
    return processResponse(resp: resp, path: path, action: "PATCH", body: body);
  }

  ResultadoState processResponse({
    required Response resp,
    required String path,
    required String action,
    dynamic body,
  }) {
    dynamic response;
    try {
      response = json.decode(utf8.decode(resp.bodyBytes));
    } catch (error) {
      print(
          "Ocurrio un error al procesar el endpoint: $path tipo:$action statusCode:${resp.statusCode} error:$error");
    }

    ResultadoState resultadoState;
    if (resp.statusCode >= 200 && resp.statusCode < 300) {
      resultadoState = ResultadoState.loaded(response);
    } else {
      final message = response["apiMensaje"] ??
          "Ocurrio un error al procesar la información";
      resultadoState = ResultadoState.error(message);
    }

    print("RestApi path $action :${"$baseUrl/$path"} ${resp.statusCode}");
    if (body != null) print("RestApi body :$body");
    print("RestApi header :$headers");
    print("RestApi response :${utf8.decode(resp.bodyBytes)}");

    return resultadoState;
  }
}
