import 'package:flutter/material.dart';
import 'package:myanmyanti/controller/HowtoPreventNotifier.dart';
import 'package:myanmyanti/controller/MyApi.dart';
import 'package:provider/provider.dart';


class howtoprevent extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return howtopreventState();
  }
}

class howtopreventState extends State<howtoprevent>{

  bool loading = false ;

  @override
  void initState() {
    HowtoPreventNotifier hnotifier = Provider.of<HowtoPreventNotifier>(context, listen: false);
    getPrevention(hnotifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    HowtoPreventNotifier hnotifier = Provider.of<HowtoPreventNotifier>(context, listen: true);

    final silverListContainer = CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildBuilderDelegate((BuildContext context, int index) {

            var id = hnotifier.preventionList[index].id;
            var titl = hnotifier.preventionList[index].title;
            String img = hnotifier.preventionList[index].imageLink;
            var detail = hnotifier.preventionList[index].detailFact;

            return Container(
              child: Column(
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.only(right: 20, top: 0,left: 20, bottom: 20),
                      child: Align(alignment: Alignment.topLeft,
                          child: Text("$id . $titl",style: TextStyle(fontSize: 23,fontFamily: 'Pyidaungsu'),textDirection: TextDirection.ltr)
                      )
                  ),
                  Container(
                    child: Image.network('$img'),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 20, top: 20,left: 20, bottom: 20),
                    child: Text(detail,style: TextStyle(fontSize: 16,fontFamily: 'Pyidaungsu'),textAlign: TextAlign.justify,),
                  )
                ],
              ),
            );
          },
            // Or, uncomment the following line:
            childCount: hnotifier.preventionList.length,
          ),
        )
      ],
    );

    final myContainer = Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 50, right: 30, left: 30),
          child: Align(alignment: Alignment.topRight,
            child: Text("ကာကွယ်နည်းများ",
              style: TextStyle(fontSize: 25, color: Colors.black,fontFamily: 'Pyidaungsu'),
              textAlign: TextAlign.center,),
          ),
        ),
        Container(
            padding: EdgeInsets.only(top: 120),
            child:  silverListContainer
        ),
      ],
    );

    return Scaffold(
        body: myContainer
    );

  }

}