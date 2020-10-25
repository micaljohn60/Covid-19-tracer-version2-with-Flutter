import 'package:flutter/material.dart';
import 'package:myanmyanti/controller/MyApi.dart';
import 'package:myanmyanti/controller/NewsNotifier.dart';
import 'package:provider/provider.dart';

import 'NewsDetail.dart';

class News extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NewsState();
  }

}

class NewsState extends State<News>{

  @override
  void initState() {
    NewsNotifier nnotifier = Provider.of<NewsNotifier>(context, listen: false);
    getNews(nnotifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    NewsNotifier nnotifier = Provider.of<NewsNotifier>(context,listen: true);

    final listContainer =  Container(

        child:  ListView.builder(
          itemCount: nnotifier.newsList.length,
          itemBuilder: (context, int index) {

            var title = nnotifier.newsList[index].title;
            var img = nnotifier.newsList[index].imageLink;
            var subtitle =nnotifier.newsList[index].subTitle;
            var detail =nnotifier.newsList[index].detail;

            return Container(
              margin: EdgeInsets.only(left: 7,right: 7),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              height: 440,
              child: Card(
                child: new InkWell(
                    onTap: () {
                      Navigator.push(context,MaterialPageRoute(
                          builder: (context) => NewsDetail(title,img,detail)));
                    },
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 15,top: 15,bottom: 15),
                            child: Align(alignment: Alignment.topLeft,
                              child: Text(title, style: TextStyle(fontSize: 22,fontFamily: 'Pyidaungsu'),
                              ),
                            ),
                          ),

                          flex: 0,
                        ),
                        Expanded(
                            flex: 3,
                            child: Container(
                                child: Image.network(img)
                            )
                        ),
                        Expanded(
                            child: Container(
                                padding: EdgeInsets.only(top: 10,left: 15,right: 15),
                                child: Align(alignment: Alignment.topLeft,
                                  child: Text(subtitle, style: TextStyle(fontSize: 16,fontFamily: 'Pyidaungsu'),),
                                )
                            )
                        )
                      ],
                    )
                ),
              ),
            );
          },
        )

    );

    final myContainer = Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(

          ),
          height: MediaQuery.of(context).size.height,
          child: Container(
            padding: EdgeInsets.only(top: 50, right: 30, left: 30),
            child: Align(alignment: Alignment.topCenter,
              child: Text("သတင်းများ",
                style: TextStyle(fontSize: 25, color: Colors.black,fontFamily: 'pyidaungsu'),
                textAlign: TextAlign.center,),
            ),
          ),
        ),

        Container(
            padding: EdgeInsets.only(top: 45),
            child: Align(alignment: Alignment.topRight,
              child: IconButton(icon: Icon(Icons.refresh,color: Colors.black,),
                  onPressed: (){
                    setState(() {
                      News();
                    });
                  }
              ),)
        ),

        Container(
          padding: EdgeInsets.only(top: 100),
          child: listContainer,
        ),
      ],
    );

    return Scaffold(
        body: myContainer
    );
  }


}