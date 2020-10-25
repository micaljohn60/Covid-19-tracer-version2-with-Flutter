import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Dashboard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DashboardState();
  }

}

class DashboardState extends State<Dashboard>{

  // ignore: non_constant_identifier_names
  List country_data = List();
  Map oneCountry = Map ();
  String dead;
  String dropdownValue ="Myanmar";


  Future getCountries() async{
    Response response = await get ("https://api.covid19api.com/summary");
    Map mapCountries = jsonDecode(response.body.toString());
    List listCountries = mapCountries["Countries"];
    setState(() {
      country_data = listCountries;
      country_data.removeAt(30);
      country_data.removeAt(34);
      country_data.removeAt(177);
      country_data.removeAt(177);

    });

    }

    Future getCountryData(Country) async {
      Response response1 =  await get ("https://api.covid19api.com/dayone/country/$Country");
      List countries = jsonDecode(response1.body.toString());

      setState(() {
        for(int i=0;i<=countries.length-1;i++){
          oneCountry = countries[i];
        }
      });

    }

  @override
  void initState() {
    super.initState();
    this.getCountries();
    this.getCountryData(dropdownValue);
  }

  @override
  Widget build(BuildContext context) {


    final dropDown = Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: Color(0xFFE5E5E5),
        )
      ),
      child: Row(
        children: <Widget>[
          Icon(Icons.location_on,color:  Colors.blue,),
          SizedBox(width: 20,),
          Expanded(
            child: DropdownButton(
              isExpanded: true,
              underline: SizedBox(),
              icon: Icon(Icons.arrow_drop_down),
              value: dropdownValue,
              items: country_data.map((item){
                return DropdownMenuItem<String>(
                  value: item['Country'].toString(),
                    child: Text(item["Country"]),
                );
              }
              ,).toList(),
              onChanged: (String newValue){
              setState(() {
                dropdownValue = newValue;
                getCountryData("$dropdownValue");
              });
            },
            ),
          )
        ],
      ),
    );

    final caseUpdate =
    Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        children: <Widget>[
          Row(children: <Widget>[
              Text("Case Update",style: TextStyle(fontSize: 18),),
          ],
          ),
          Row(children: <Widget>[
            Text("Newest Update is ",style: TextStyle(fontSize: 15),),
            Text(oneCountry['Date'].toString(),style: TextStyle(fontSize: 15),),
          ],
          ),
        ],
      ),

    );

//    final myCard =
//    Container(
//      margin: EdgeInsets.all(10),
//      padding: EdgeInsets.all(20),
//      decoration: BoxDecoration(
//        borderRadius: BorderRadius.circular(20),
//        color: Colors.white,
//        boxShadow: [
//          BoxShadow(
//            offset: Offset(0,0),
//            blurRadius: 5,
//            color: Colors.black.withOpacity(0.3)
//          )
//        ]
//      ),
//      child: Row(
//        mainAxisAlignment: MainAxisAlignment.spaceAround,
//        children: <Widget>[
//          Column(
//            children: <Widget>[
//              Container(
//                padding: EdgeInsets.all(6),
//                height: 25,width: 25,
//              decoration: BoxDecoration(
//                shape: BoxShape.circle,color: Colors.red
//              ),
//                child: Container(
//                ),
//
//              ),
//              SizedBox(height: 10,),
//              Text(oneCountry['Deaths'].toString(), style: TextStyle(fontSize: 40,color: Colors.red),),
//              Text("Dead")
//            ],
//          ),
//          SizedBox(height: 30,),
//          Column(
//            children: <Widget>[
//              Container(
//                padding: EdgeInsets.all(6),
//                height: 25,width: 25,
//                decoration: BoxDecoration(
//                    shape: BoxShape.circle,color: Colors.orange
//                ),
//                child: Container(
//
//                ),
//
//              ),
//              SizedBox(height: 10,),
//              Text(oneCountry['Confirmed'].toString(), style: TextStyle(fontSize: 40,color: Colors.orange),),
//              Text("Infected")
//            ],
//          ),
//          SizedBox(height: 30,),
//          Column(
//            children: <Widget>[
//              Container(
//                padding: EdgeInsets.all(6),
//                height: 25,width: 25,
//                decoration: BoxDecoration(
//                    shape: BoxShape.circle,color: Colors.green
//                ),
//                child: Container(
//                ),
//
//              ),
//              SizedBox(height: 10,),
//              Text(oneCountry['Recovered'].toString(), style: TextStyle(fontSize: 40,color: Colors.green),),
//              Text("Recovered")
//            ],
//          )
//        ],
//      ),
//
//    );

    final myCard1 =
    Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  offset: Offset(0,0),
                  blurRadius: 5,
                  color: Colors.black.withOpacity(0.3)
              )
            ]
        ),
      child: Row(
        children: <Widget>[

            Container(
              padding: EdgeInsets.all(6),
              height: 25,width: 25,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,color: Colors.red
              ),
              child: Container(
              ),

            ),
            SizedBox(height: 10, width: 20,),
            Text(oneCountry['Deaths'].toString(), style: TextStyle(fontSize: 40,color: Colors.red),),

          ],

      ),
    );

    final myCard2 =
    Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                offset: Offset(0,0),
                blurRadius: 5,
                color: Colors.black.withOpacity(0.3)
            )
          ]
      ),
      child: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(6),
            height: 25,width: 25,
            decoration: BoxDecoration(
                shape: BoxShape.circle,color: Colors.orange
            ),
            child: Container(
            ),

          ),
          SizedBox(height: 10, width: 20,),
          Text(oneCountry['Confirmed'].toString(), style: TextStyle(fontSize: 40,color: Colors.orange),),

        ],

      ),
    );

    final myCard3 =
    Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                offset: Offset(0,0),
                blurRadius: 5,
                color: Colors.black.withOpacity(0.3)
            )
          ]
      ),
      child: Row(
        children: <Widget>[

          Container(
            padding: EdgeInsets.all(6),
            height: 25,width: 25,
            decoration: BoxDecoration(
                shape: BoxShape.circle,color: Colors.green
            ),
            child: Container(
            ),

          ),
          SizedBox(height: 10, width: 20,),
          Text(oneCountry['Recovered'].toString(), style: TextStyle(fontSize: 40,color: Colors.green),),

        ],

      ),
    );

    final myContainer = Stack (
      children: <Widget>[
        ClipPath(
          clipper: MyClip(),
          child: Container(
            height: 300,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("image/3634122.jpg"),
                    fit: BoxFit.fitWidth)
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 130),
          padding: EdgeInsets.only(top: 99, right: 20),
          child: Align(
            alignment: Alignment.topRight,
            child: Text("သင်လုပ်ရမယ့်တာဝန်က \nMOHS ကထုတ်ကပြန်ထားတဲ့ စည်းကမ်းတွေကိုလိုက်နာဖို့ပါဘဲ", style: TextStyle(fontSize: 19,fontFamily: "pyidaungsu",color: Colors.pink),),
          ),
        ),
        Container(
            padding: EdgeInsets.only(top: 45),
            child: Align(alignment: Alignment.topRight,
              child: IconButton(icon: Icon(Icons.refresh,color: Colors.black,),
                  onPressed: (){
                    setState(() {
                      getCountries();
                      getCountryData(dropdownValue);
                    });
                  }
              ),)
        )


      ],

    );

    final myCustomScroll = CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildBuilderDelegate((BuildContext context,int index){
            return Container(
              child: Column(
                children: <Widget>[
                  myContainer,
                  dropDown,
                  caseUpdate,
                  //myCard,
                  myCard3,
                  myCard2,
                  myCard1
                ],
              ),
            );
          },childCount: 1
          ),
        )
      ],
    );

   return Scaffold(
      body: myCustomScroll
   );
  }

}

class MyClip extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
   var path =Path();
   path.lineTo(0, size.height-80);
   path.quadraticBezierTo(size.width/2, size.height, size.width, size.height - 80);
   path.lineTo(size.width, 0);
   path.close();
   return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
