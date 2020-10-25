import 'package:flutter/material.dart';
import 'package:myanmyanti/controller/HowtoPreventNotifier.dart';
import 'package:myanmyanti/controller/NewsNotifier.dart';
import 'package:myanmyanti/screens/bottomnav.dart';
import 'package:myanmyanti/screens/network_sensitive.dart';
import 'package:myanmyanti/services/service_locater.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';
import 'controller/connectivity_service.dart';
import 'emum/connectivity_state.dart';

void main() {setupLocator();
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => HowtoPreventNotifier(),
          ),
          ChangeNotifierProvider(
            create: (context) => NewsNotifier(),
          )
        ],
          child: MyApp()
      )
      );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StreamProvider<ConnectivityStatus>(
      create: (context) => ConnectivityService().connectionStatusController.stream,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: NetworkSensitive(
              child: SplashScreen(
                seconds: 5,
                navigateAfterSeconds: BottomNav(),
                title: new Text('ဒါကတော့ မြန်မာနိုင်ငံ အတွက်ပါပဲ',
                  style: new TextStyle(
                    fontFamily: 'pyidaungsu',
                   fontSize: 20.0
                  ),),
                 image: Image.network("https://images.squarespace-cdn.com/content/5eb112fef0d8aa5d9a17ee3d/1588666301433-WA5VOQHO6S9UT8FF3FVO/myan+myan+ti+web+logo.jpg?content-type=image%2Fjpeg"),
                  backgroundColor: Colors.white,
                  styleTextUnderTheLoader: new TextStyle(),
                   photoSize: 100,
                   loaderColor: Colors.blue
              ),
            )
        ),
      ),
    );
  }

}

//class MyAppState extends State<MyApp>{
//
//  void getData() async {
//    String Slug;
//    Response response = await get("https://api.covid19api.com/countries");
//    List data = jsonDecode(response.body);
//    for(int i=0; i<data.length; i++) {
//      Map data1 = data[i];
//      Slug = data1['Slug'];
////      print(data1['Slug']);
//    }
//    Response response1 = await get("https://api.covid19api.com/total/dayone/country/myanmar");
//    List data2 = jsonDecode(response1.body);
//    print(data2);
//  }
//
//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//    getData();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      home:  Scaffold(
//        body: Container(
//          child: Text("data"),
//        ),
//      ),
//    );
//  }
//
//}


