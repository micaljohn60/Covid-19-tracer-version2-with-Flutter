import 'package:flutter/material.dart';

class Symptoms extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SymptomsState();
  }
}

class SymptomsState extends State<Symptoms>{

  @override
  Widget build(BuildContext context) {

    final customScroll = Container(
      padding: EdgeInsets.symmetric(horizontal:10, vertical: 110),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverList(delegate: SliverChildBuilderDelegate((BuildContext context,int index){
              return
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: <Widget>[
                      Text("COVID-19 ရောဂါလက္ခဏာများ",style: TextStyle(fontSize: 20,fontFamily: "pyidaungsu"),),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          SymptomCard(image: "image/fever.jpg",title: "အဖျားတတ်ခြင်း",),
                          SymptomCard(image: "image/cough.jpg",title: "ချောင်းခြောက် \nဆိုးခြင်း",),
                          SymptomCard(image: "image/tiredness.jpg",title: "မောပန်းခြင်း",),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Text("ဒါတွေလည်းဖြစ်တတ်တယ်နော်",style: TextStyle(fontSize: 20,fontFamily: "pyidaungsu"),),
                      SizedBox(height: 20,),
                      PreventionCard(image: "image/dtb.jpg",body: "ဤရောဂါလက္ခဏာများသည်များသောအားဖြင့်နူးညံ့ပြီးတဖြည်းဖြည်းစတင်သည်။ အချို့လူများသည်ရောဂါကူးစက်ခံရသော်လည်းအလွန်နူးညံ့သောရောဂါလက္ခဏာများရှိသည်။",),
                      PreventionCard(image: "image/14days.jpg",body: "ပျမ်းမျှအားဖြင့်ရောဂါလက္ခဏာပြရန်တစ်စုံတစ် ဦး သည်ဗိုင်းရပ်စ်ပိုးကူးစက်ခံရသည့်အချိန်မှ ၅ ရက်မှ ၆ ရက်အထိကြာသော်လည်း ၁၄ ရက်အထိကြာနိုင်သည်။",),
                      PreventionCard(image: "image/other.jpg",body: "အခြားလက္ခဏာများတွင် - အသက်ရှူကျပ်ခြင်း၊ကြွက်သားများနာ၊ချမ်းတုန်၊လည်ချောင်းနာသည်၊ခေါင်းကိုက်ခြင်း၊ရင်ခေါင်းနာခြင်း တို့လည်းဖြစ်ပေါ်စေတတ်သည်",),
                    ],
                  ),
                );
          },childCount: 1
          ))
        ],
      ),
    );


    final header = Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 55, right: 10, left: 30),
          child: Align(alignment: Alignment.topRight,
            child: Text("COVID 19 ရောဂါ လက္ခဏာများ",
              style: TextStyle(fontSize: 18, color: Colors.black),
              textAlign: TextAlign.center,),
          ),
        ),
        customScroll,
        Positioned(
          left: 8.0,
          top: 60.0,
          child: InkWell(
            onTap: () {
              setState(() {
                  Navigator.pop(context);
              });
            },
            child: Icon(Icons.arrow_back, color: Colors.black),
          ),
        ),

      ],

    );

    return Scaffold(
      body: header
    );
  }

}


class PreventionCard extends StatelessWidget{
  final String image;
  final String body;

  const PreventionCard({Key key, this.image, this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(height: 156,child: Stack(
      alignment: Alignment.centerLeft,
      children: <Widget>[
        Container(
          height: 136,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [BoxShadow(
                  blurRadius: 10,
                  color: Colors.black12
              )]
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
         child: Image.asset("$image"),
        ),

        Positioned(
            left: 130,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              width: MediaQuery.of(context).size.width-170,
              height: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  Text("$body",style: TextStyle(fontFamily: 'pyidaungsu',fontSize: 12),textAlign: TextAlign.justify,)
                ],
              ),
            ))
      ],
    ),);
  }
}

class SymptomCard extends StatelessWidget{

  final String image;
  final String title;

  const SymptomCard({
    Key key, this.image, this.title,
}):super(key: key);


  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0,1),
              blurRadius: 10,
              color: Colors.black12,
            )
          ]
      ),
      child: Column(
        children: <Widget>[
          Image.asset("$image", height: 80,),
          Text("$title",style: TextStyle(fontFamily: 'pyidaungsu',fontSize: 10),)
        ],
      ),
    );
  }

}