import 'dart:async';
import 'dart:io';
import 'package:chopper/chopper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PawPlaceApiInterceptor
    implements RequestInterceptor, ResponseInterceptor {
  final bool showLogs;

  PawPlaceApiInterceptor({this.showLogs = false});

  @override
  FutureOr<Request> onRequest(Request request) async {
    var packageInfo = await PackageInfo.fromPlatform();
    final idToken = await FirebaseAuth.instance.currentUser?.getIdToken();
    Map<String, String> modifiedHeader = Map.from(request.headers);
    modifiedHeader.putIfAbsent('Content-Type', () => 'application/json');
    if (idToken != null) {
      // debugPrint("Token: $token");
      modifiedHeader.putIfAbsent('Authorization', () => 'Bearer $idToken');
    }

    modifiedHeader.putIfAbsent('client', () => packageInfo.packageName);
    modifiedHeader.putIfAbsent('build', () => packageInfo.buildNumber);
    modifiedHeader.putIfAbsent('version', () => packageInfo.version);
    if (packageInfo.buildSignature.isNotEmpty) {
      modifiedHeader.putIfAbsent('sign', () => packageInfo.buildSignature);
    }

    Request modified = Request(
      request.method,
      request.url,
      request.baseUri,
      body: request.body,
      headers: modifiedHeader,
      multipart: request.multipart,
      parameters: request.parameters,
      parts: request.parts,
    );

    if (kDebugMode) {
      print('');
      print(
          '|-------------------------------------------------------------------------------');
      print('|               REQUEST');
      print(
          '|-------------------------------------------------------------------------------');
      print('| ${modified.method} --> ${modified.url}');
      print('| Headers --> ${modified.headers}');
      print('| Body --> ${modified.body}');
      print('| Parameters --> ${modified.parameters}');
      print(
          '|_______________________________________________________________________________');
    }
    return modified;
  }

  @override
  FutureOr<Response> onResponse(Response response) {
    if (kDebugMode) {
      print('');
      print(
          '|-------------------------------------------------------------------------------');
      print('|               RESPONSE');
      print(
          '|-------------------------------------------------------------------------------');
      print(
          '| ${response.base.request!.method} --> ${response.base.request!.url}');
      print('| Status code --> ${response.statusCode}');
      print('| Headers --> ${response.headers}');
      print('| Is successful --> ${response.isSuccessful}');
      if (response.isSuccessful) {
        print('| Body --> ${response.bodyString}');
      } else {
        print('| Error --> ${response.error}');
      }
      print(
          '|-------------------------------------------------------------------------------');
    }

    if (response.statusCode == HttpStatus.unauthorized) {
      if (kDebugMode) print('UNAUTHORIZED');
    }
    return response;
  }
}
