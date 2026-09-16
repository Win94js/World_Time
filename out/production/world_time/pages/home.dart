import "package:flutter/material.dart";

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data: ModalRoute.of(context)!.settings.arguments as Map;
    print("Data is : $data");
    
    String bgImage = data["isDayTime"] ? "day.jpg" : "night.jpg";
    Color backgroundColor = data["isDayTime"] ? Colors.blue : Colors.indigo;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/${bgImage}"),
            fit: BoxFit.cover,


            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,120.0,0,0),
            child: Column(
              children: <Widget>[
                TextButton.icon(
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, "/location");
                    setState(() {
                      data = {
                        "time" : result[]
                      }
                    });
                  },
                  icon: Icon(Icons.edit_location,
                  color: Colors.deepOrange),
                  label: Text("Edit Location",
                  style: TextStyle(color: Colors.deepOrange)),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(data["location"],
                      style: TextStyle(
                        color: Colors.blue[900],
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                      )
                    ),
                  ],
            ),
                SizedBox(height: 20),
                Text(
                  data["time"],
                  style: TextStyle(
                    fontSize: 66.0,
                    color: Colors.blue[900]
          
                  ),
                )
                  ],
            ),
          ),
        ),
      ),

    );
  }
}
