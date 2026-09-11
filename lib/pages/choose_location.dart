import "package:flutter/material.dart";

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  int counter = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Init State is  running");
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
      body: ElevatedButton(
        onPressed: () {
          setState(() {
            counter++;
          });
        },
        child: Text("Counter is ${counter}"),
      ),
    );
  }
}
