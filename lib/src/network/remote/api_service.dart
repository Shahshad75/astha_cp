import 'dart:convert';
import 'dart:io';
import 'package:astha_cp/utils/typedef.dart';
import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;

import '../../../utils/app_exception.dart';

class ApiService {
  // ignore: prefer_final_fields
  static Map<String, String>? _header = {
    'Content-Type': 'application/json',
    'Authorization': ''
  };

  static EitherResponse postApi(String url, Map map,
      [String? userToken]) async {
    print('map$map url $url');
    final uri = Uri.parse(url);
    if (userToken != null) {
      _header!['Authorization'] = userToken;
    }
    final body = jsonEncode(map);
    dynamic fetchedData;
    try {
      print('bfore ------------------ 77');
      print("encode data $body");
      final response = await http.post(uri, body: body, headers: _header);
      print("response ----------${response.body}");

      fetchedData = _getResponse(response);

      return Right(fetchedData);
    } on SocketException {
      print('socket__----------');
      return Left(InternetException());
    } on http.ClientException {
      return Left(RequestTimeOutException());
    } on Unauthorized {
      return Left(Unauthorized("Invalid email/mobile or password"));
    } catch (e) {
      print('socket__----------$e');
      return Left(BadRequestException(e));
    }
  }

  static EitherResponse getApi(String url, [String? token]) async {
    final uri = Uri.parse(url);
    print('go token $token');
    if (token != null) {
      _header!['Authorization'] = token;
    }
    try {
      dynamic fetchedData;

      final response = await http.get(uri, headers: _header);
      fetchedData = _getResponse(response);

      return Right(fetchedData);
    } on SocketException {
      return Left(InternetException());
    } on http.ClientException {
      return Left(RequestTimeOutException());
    } catch (e) {
      return Left(BadRequestException(e));
    }
  }

  static EitherResponse deleteApi(String url, [String? token]) async {
    final uri = Uri.parse(url);
    if (token != null) {
      _header!['Authorization'] = token;
    }
    try {
      dynamic fetchedData;
      final response = await http.delete(uri, headers: _header);
      fetchedData = _getResponse(response);

      return Right(fetchedData);
    } on SocketException {
      return Left(InternetException());
    } on http.ClientException {
      return Left(RequestTimeOutException());
    } catch (e) {
      return Left(BadRequestException(e));
    }
  }

  static EitherResponse patch(String url, Map map, [String? userToken]) async {
    final uri = Uri.parse(url);
    if (userToken != null) {
      _header!['Authorization'] = userToken;
    }
    final body = jsonEncode(map);
    dynamic fetchedData;
    try {
      final response = await http.patch(uri, body: body, headers: _header);

      fetchedData = _getResponse(response);

      return Right(fetchedData);
    } on SocketException {
      return Left(InternetException());
    } on http.ClientException {
      return Left(RequestTimeOutException());
    } catch (e) {
      return Left(BadRequestException(e));
    }
  }

  static _getResponse(http.Response response) {
    final body = jsonDecode(response.body);
    switch (response.statusCode) {
      case 200:
        return (jsonDecode(response.body));
      case 400:
        return throw BadRequestException(body['message']);

      case 401:
        return throw Unauthorized(body['message']);

      default:
        throw BadRequestException(body['message']);
    }
  }
}
