import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert';

class WorldTime {
  String location; // location name for UI
  late String time; // the time in that location
  String flag; // url to asset flag icon
  String url; // location url for api endpoint
  bool isDayTime;

  WorldTime({required this.location, required this.flag, required this.url, required this.isDayTime});

  Future<void> getTime() async {
    try {
      http.Response response = await http.get(
        Uri.parse(
          // "https://timeapi.io/api/Time/current/zone?timeZone=Asia/Yangon",
          "https://timeapi.io/api/Time/current/zone?timeZone=${url}",
        ),
      );

      Map data = jsonDecode(response.body);

      print("Data is ${data}");

      String dateTime = data["dateTime"];
      String? timezone = data["timeZone"];
      // String time = data["time"].subString(0, 3);
      print("dateTime : ${dateTime}");
      print("timezone : ${timezone}");

      DateTime now = DateTime.parse(dateTime);
      print("NOW is : ${now}");

//       time = now.toString();
        isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
        time = DateFormat.jm().format(now);

    } catch (e) {

      print("Caught error : $e");
      time = "Could not get time data";
    }
  }
}
