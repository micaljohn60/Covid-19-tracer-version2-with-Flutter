
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myanmyanti/services/calls_and_messages_service.dart';
import 'package:myanmyanti/services/service_locater.dart';

class Calls extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CallsState();
  }
}

class CallsState extends State<Calls> {

  final String number = "067411189";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,

         child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  myCall(title: "ကျန်းမာရေးနှင့်အားကစားဝန်ကြီးဌာန",number:"067411189"),
                  SizedBox(height: 20,),
                  myCall(title: "COVID 19 Call Center",number:"2019"),
                  SizedBox(height: 20,),
                  myCall(title: "အရေးပေါဌာန",number:"192"),

                ]
            )


      ),
    );
  }
}

class myCall extends StatelessWidget{

  final String title;
  final String number;
  const myCall({Key key, this.title, this.number}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final CallsAndMessagesService _service = locator<CallsAndMessagesService>();
    // TODO: implement build
    return ButtonTheme(
      minWidth: 350,
      child:  RaisedButton(
        elevation: 5.0,
        color: Colors.white,
        shape:  RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
        child: Column(

          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Text(
              "$title", style: TextStyle(fontSize: 20,fontFamily: "pyidaungsu"),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
             children: <Widget>[
               Container(
                 padding: EdgeInsets.only(left: 90, right: 30),
                 child: Icon(Icons.call),
               ),

                Text("$number", style: TextStyle(fontSize: 25)),
              ],
            ),


            SizedBox(
              height: 10,
            ),
          ],
        ),

        onPressed: () => _service.call("$number"),
      ),

    );
  }

}