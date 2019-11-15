import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main()=> runApp(Myapp());

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ParallexScrolling",
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget{
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String asset;
  double divOne=0;
  double divFive=0;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: NotificationListener(
        onNotification: (notify) {
          if(notify is ScrollUpdateNotification){
            setState(() {
             divOne += notify.scrollDelta/1; 
             divFive += notify.scrollDelta/5; 
            });
          } return true;
        },
        child: Stack(children: <Widget>[
          ListView(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment(0.5,0.0),
                    colors: [Color.fromRGBO(233,0,94,1),
                    Colors.cyanAccent],
                    tileMode: TileMode.mirror)),
                    height: 1200
                    )]
                    ),
                    

                    ParallaxWidgetLeft(colour: Colors.white, left: 170 - divOne*3,top: 120 + divFive, asset: "This is"),
                    ParallaxWidgetLeft(colour: Colors.white, left: 20 + divOne*2, top:400 + divFive/2,asset: "Parallex\n  Scrolling"),
                    ParallaxWidgetImageLeft(left: 20, top: 100-divOne, height: 200, width: 200, asset: "photo6", widget: ParallaxWidgetLeft(colour: Colors.cyanAccent,left: 150 - divOne*3, top: 20 + divOne+divFive, asset: "This is",)),
                    ParallaxWidgetImageLeft(left: 200-divOne, top: 350 - divOne, height: 300, width: 300, asset: "photo7", widget: ParallaxWidgetLeft(colour: Color.fromRGBO(233,0,94,1),left: -180 + divOne*3, top: 50 + divOne+divFive/2, asset: "Parallex\n  Scrolling",)),
                    ParallaxWidgetLeft(colour: Colors.white, left: divFive, top:720 - divOne,asset: "Be creative",),
                    ParallaxWidgetImageLeft(left: 95, top: 700- divOne, height: 400, width: 230, asset: "photo3", widget: ParallaxWidgetLeft(colour: Color.fromRGBO(233,0,94,1),left:-95 + divFive, top: 20, asset: "Be creative",))

                      
         ] 
                  )
                )
              );
  }
}

class ParallaxWidgetLeft extends StatelessWidget{

  const ParallaxWidgetLeft({
    Key key,
    @required this.left,
    @required this.top,
    @required this.asset,
    @required this.colour,
  }) : super(key: key);

  final double left;
  final double top;
  final String asset;
  final Color colour;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      child: Text(asset, style: TextStyle(color: colour, fontWeight: FontWeight.w900, fontSize: 60.0, fontFamily:"Helvetica")
      ),
    );
  }
}

class ParallaxWidgetImageLeft extends StatelessWidget{

  const ParallaxWidgetImageLeft({
    Key key,
    @required this.left,
    @required this.top,
    @required this.asset,
    @required this.height,
    @required this.width,
    @required this.widget,
  }) : super(key: key);

  final double left;
  final double top;
  final String asset;
  final double height;
  final double width;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      child: Container(decoration: BoxDecoration(image: DecorationImage(
        fit: BoxFit.cover,
        image: new ExactAssetImage("assets/$asset.png")
      ),
      borderRadius: BorderRadius.circular(12.0)),
      height: height,
      width: width,
      child: Stack(children: <Widget>[
        widget
      ],),)
      );
  }
}