import 'dart:async';
import 'dart:convert' as convert;
import 'dart:developer' as developer;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:simple_moment/simple_moment.dart';

class ServerTimeController with ChangeNotifier {
  late DateTime _now;
  late Timer _timer;
  late Duration _offset;
  int attempts = 0;
  bool debug = true;

  static ServerTimeController get instance =>
      GetIt.instance<ServerTimeController>();

  static initialize() => GetIt.instance
      .registerSingleton<ServerTimeController>(ServerTimeController());

  @override
  dispose() {
    _timer.cancel();
    super.dispose();
  }

  Future<Duration?> getServerOffset() async {
    ///kill switch at 10 attempts
    if (attempts > 10) {
      return Duration.zero;
    }
    try {
      attempts++;
      final Uri url = Uri.https(
          'timeapi.io',
          '/api/Time/current/zone?timeZone=Europe/Copenhagen',
          {'timeZone': 'Europe/Copenhagen'});
      DateTime requestStart = DateTime.now();
      http.Response response = await http.get(url);
      DateTime requestEnd = DateTime.now();
      if (response.statusCode == 200) {
        final jsonResponse = convert.jsonDecode(response.body);
        Map<String, dynamic> json = Map<String, dynamic>.from(jsonResponse);
        DateTime ntp = DateTime.parse(json['dateTime']);
        Duration apiCallDuration = requestEnd.difference(requestStart);
        Duration tempOffset = Duration(
            milliseconds: apiCallDuration.inMilliseconds +
                ntp.difference(DateTime.now()).inMilliseconds);
        return tempOffset;
      } else {
        developer.log(
          'Getting the server offset failed on the request level',
          name: 'SERVER_TIME',
        );
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<void> setup() async {
    _offset = Duration.zero;
    _now = DateTime.now().add(_offset);

    //todo keep querying until you get a proper time if it fails;
    setServerOffset();

    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        _now = DateTime.now().add(_offset);
        notifyListeners();
      },
    );
  }

  setServerOffset() async {
    Duration? tempOffset = await getServerOffset();
    if (tempOffset != null) {
      _offset = tempOffset;
      _now = DateTime.now().add(_offset);
    } else {
      developer.log(
        'Failed to get server offset, running code again',
        name: 'SERVER_TIME',
      );
      setServerOffset();
    }
  }

  Moment serverMomentFromTimestamp(Timestamp ts) {
    return Moment.fromDateTime(ts.toDate().add(_offset));
  }

  bool get isNewMinute => _now.second == 0;

  String format(String pattern, {String? localeOverride}) {
    return Moment.fromDateTime(_now)
        .format(pattern, localeOverride: localeOverride);
  }

  DateTime get now => _now;
}
