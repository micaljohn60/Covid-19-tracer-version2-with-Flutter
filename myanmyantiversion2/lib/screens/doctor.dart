import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myanmyanti/screens/symptoms.dart';
import 'package:myanmyanti/screens/videoplayer.dart';
import 'package:myanmyanti/screens/videoplayer1.dart';


class Doctor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final myContainer = Stack (
      children: <Widget>[
        Container(
            height: 300,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("image/doctor.jpg"),
                    fit: BoxFit.fitWidth)
            ),
          ),
        Container(
          margin: EdgeInsets.only(left: 10),
          padding: EdgeInsets.only(top: 120, right: 20),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text("Keep Distance | Wash Hands |\nFollow Medical Rules |\n Stop Covid 19", style: TextStyle(fontSize: 18),),
          ),
        ),
      ],
    );

    final taT = Container (
      padding: EdgeInsets.all(20),
    child: Column(
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: Text("Tips and Tricks By Dr laurel",style: TextStyle(fontSize: 20),),
        ),

      ],
    ),
    );

    final myButton1 = Container(

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          RaisedButton(
            shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
            color: Colors.white,
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => VideoPlayerScreen(),));
            },
            child: Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 20,bottom: 10),
                      child: Text("Dr laurel ရဲ့ \n လက်ဆေးနည်း ",style: TextStyle(fontSize: 15,fontFamily: "pyidaungsu"),),
                    ),
                    Container(
                        padding: EdgeInsets.only(bottom: 20),
                        child:
                            Align(alignment: Alignment.bottomRight,
                              child: Image.asset("image/handwash.png"),)
                    )
                  ],
                )
              ],
            ),
          ),
          RaisedButton(
            shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
            color: Colors.white,
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => VideoPlayerScreen1(),));
            },
            child: Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 20,bottom: 10),
                      child: Text("COVID-19 \nFasle Negative?!?",style: TextStyle(fontSize: 15,fontFamily: 'pyidaungsu'),),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 20),
                        child: Column(
                          children: <Widget>[
                            Align(alignment: Alignment.topCenter,
                              child: Image.asset("image/doctor1.png"),)
                          ],
                        )
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      )
    );

    final myButton = Container(
      margin: EdgeInsets.only(left: 20,right: 20),
      width: MediaQuery.of(context).size.width,
      child: RaisedButton(
        color: Colors.white,
        onPressed: (){
         Navigator.push(context, MaterialPageRoute(builder: (context)=>Symptoms()));
        },
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child:  FaIcon(FontAwesomeIcons.viruses,color: Colors.red,size: 30,)
            ),
            Container(
              child: Text("COVID 19 လက္ခဏာများ",style: TextStyle(fontSize: 18,fontFamily: "pyidaungsu"),),
            )
          ],
        ),
      ),
    );

    final myCustomScroll = CustomScrollView(
      slivers: <Widget>[
        SliverList(
            delegate: SliverChildBuilderDelegate((BuildContext context,int index){
              return Container(
                child: Column(
                  children: <Widget>[
                    myContainer,
                    myButton,
                    taT,
                    myButton1,
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