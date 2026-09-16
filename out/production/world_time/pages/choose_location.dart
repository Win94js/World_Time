import "package:flutter/material.dart";
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  int counter = 0;

  List<WorldTime> locations = [
    // Asia
    WorldTime(url: 'Asia/Yangon', location: 'Yangon', flag: 'myanmar.png',isDayTime: false),
    WorldTime(url: 'Asia/Bangkok', location: 'Bangkok', flag: 'thailand.png',isDayTime: false),
    WorldTime(url: 'Asia/Singapore', location: 'Singapore', flag: 'singapore.png',isDayTime: false),
    WorldTime(url: 'Asia/Tokyo', location: 'Tokyo', flag: 'japan.png',isDayTime: false),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png',isDayTime: false),
    WorldTime(url: 'Asia/Dubai', location: 'Dubai', flag: 'uae.png',isDayTime: false),
    WorldTime(url: 'Asia/Kolkata', location: 'Kolkata', flag: 'india.png',isDayTime: false),

    // Europe
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png',isDayTime: false),
    WorldTime(url: 'Europe/Berlin', location: 'Berlin', flag: 'germany.png',isDayTime: false),
    WorldTime(url: 'Europe/Paris', location: 'Paris', flag: 'france.png',isDayTime: false),
    WorldTime(url: 'Europe/Rome', location: 'Rome', flag: 'italy.png',isDayTime: false),

    // Americas
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png',isDayTime: false),
    WorldTime(url: 'America/Los_Angeles', location: 'Los Angeles', flag: 'usa.png',isDayTime: false),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png',isDayTime: false),
    WorldTime(url: 'America/Toronto', location: 'Toronto', flag: 'canada.png',isDayTime: false),
    WorldTime(url: 'America/Sao_Paulo', location: 'Sao Paulo', flag: 'brazil.png',isDayTime: false),

    // Africa & Australia
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png',isDayTime: false),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png',isDayTime: false),
    WorldTime(url: 'Australia/Sydney', location: 'Sydney', flag: 'australia.png',isDayTime: false),
    WorldTime(url: 'Pacific/Auckland', location: 'Auckland', flag: 'new_zealand.png',isDayTime: false),
  ];

  void updateTime(index) async{
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {

        'location': instance.location,
        "flag" : instance.flag,
        "time" : instance.time,
        "isDayTime" : instance.isDayTime,
      
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    print("Build State is  running");

    return Scaffold(
      backgroundColor: Colors.grey[200],

      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        foregroundColor: Colors.white,
        title: Text("Choose Location", style: TextStyle(color: Colors.white)),

        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(itemCount: locations.length,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: (){
                    updateTime(index);
                  },
                  title: Text(
                    locations[index].location
                  ),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/${locations[index].flag}"),
                  ),
                )
              ),
            );
          })
    );
  }
}
