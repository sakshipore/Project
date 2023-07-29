import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

class NewsService {
  Future<Map<String, dynamic>> getNews() async {
    String country = await getRemoteCountry();
    String url =
        "https://newsapi.org/v2/top-headlines?country=$country&apiKey=4cef1cf52a1d422e8e207e7528a2624d";

    var response = await Dio().getUri(Uri.parse(url));
    return response.data;
  }

  Future<String> getRemoteCountry() async {
    try {
      FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
      await remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(seconds: 10),
          minimumFetchInterval: Duration.zero,
        ),
      );
      await remoteConfig.setDefaults(<String, dynamic>{});
      await remoteConfig.fetchAndActivate();
      return remoteConfig.getString("Country");
    } on Exception catch (e) {
      log(e.toString());
      return "IN";
    }
  }
}
