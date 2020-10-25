import 'package:flutter/material.dart';

class NewsDetail extends StatefulWidget{
  String img;
  String title;
  String datail;
  NewsDetail(this.title,this.img,this.datail);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NewsDetailState(title,img,datail);
  }

}

class NewsDetailState extends State<NewsDetail> {

  String img;
  String title;
  String detail;
  NewsDetailState(this.title,this.img,this.detail);

  @override
  Widget build(BuildContext context) {

    final myContainer = Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 100),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: DraggableScrollableSheet(
            initialChildSize: 1,
            minChildSize: 1,
            maxChildSize: 1,
            builder: (context, ScrollController){
              return SingleChildScrollView(
                controller: ScrollController,
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Image.network(img),
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 15,top: 15),
                        child: Align(alignment: Alignment.topLeft,
                            child: Text(title, style: TextStyle(fontSize: 25,fontFamily: 'Pyidaungsu'),
                      ),
                      )
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 15,left: 15,bottom: 15,right: 15),
                      child: Text(detail,style: TextStyle(fontSize: 18,fontFamily: 'Pyidaungsu'),textAlign: TextAlign.justify,),
                    )
                  ],
                ),
              );
            },
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 120),

        ),
        Positioned(
          left: 8.0,
          top: 60.0,
          child: InkWell(
            onTap: () {
                Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: Colors.blue),
          ),
        )
      ],
    );


    return Scaffold(
      body: myContainer,
    );

  }
}

