import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  // void getData() async {
  //   http.Response response = await http.get(
  //     Uri.parse('https://dummyjson.com/products/1'),
  //   );
  //   // print("Resoponse : ${response.body}");
  //   Map data = jsonDecode(response.body);
  //   print("Data is ${data["title"]}");
  // }
  // String time = "Loading";

  void setUpWorldTime() async {
    WorldTime instance = WorldTime(
      location: "Berlin",
      flag: 'germany.png',
      url: 'Europe/Berlin',
    );

    await instance.getTime();
    print("***********instance.getTime : ${instance.time}");
    // setState(() {
    //   time = instance.time;
    // });
    // မျက်နှာပြင်အသစ် (/home) ကို အပေါ်ကနေ ထပ်တင်လိုက်တာ (Stack ပေါ်တင်တာ) ဖြစ်ပါတယ်။

// ဖုန်းရဲ့ Back ခလုတ်ကို နှိပ်လိုက်ရင် အရင်က မျက်နှာပြင်ဟောင်းဆီကို ပြန်သွားလို့ ရပါတယ်။ (ဥပမာ - Choose Location ကနေ Home ကိုသွားပြီး Back ပြန်နှိပ်ရင် Location ဆီ ပြန်ရောက်နိုင်ပါတယ်။)
    // Navigator.pushNamed(context, "/home"); //Navigator.pushNamed(context, "/home") (Push)

// မျက်နှာပြင်အဟောင်းကို ဖြုတ်ထုတ်လိုက်ပြီး နေရာမှာ မျက်နှာပြင်အသစ် (/home) နဲ့ အစားထိုးလိုက်တာ ဖြစ်ပါတယ်။

// ဖုန်းရဲ့ Back ခလုတ်ကို နှိပ်လို့ မျက်နှာပြင်ဟောင်း မရှိတော့ပါဘူး (App ကနေ ထွက်သွားပါမယ်)။

// အသုံးဝင်ပုံ: သင့်ရဲ့ Loading မျက်နှာပြင်လိုမျိုး တစ်ခါပဲပြပြီး ပျောက်သွားရမယ့် နေရာမျိုးမှာ သုံးပါတယ်။ Loading ပြီးလို့ Home ရောက်သွားတဲ့အခါ Back ခလုတ်နှိပ်ရင် Loading ဆီ ပြန်မသွားစေချင်တာမို့ ဒါကို သုံးတာ အကောင်းဆုံးပါပဲ။
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      "flag" : instance.flag,
      "time" : instance.time
    }); 
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setUpWorldTime();
    print("Init State is  running");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(child:  SpinKitDualRing(
        color: Colors.white,
        size: 50.0,
      ),
      ),
    );
  }
}
