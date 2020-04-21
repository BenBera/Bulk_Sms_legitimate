import 'package:bulky_sms_app/models/courseModel.dart';
import 'package:bulky_sms_app/models/quad_clipper.dart';
import 'package:bulky_sms_app/style/light_colors.dart';
import 'package:bulky_sms_app/style/theme.dart';
import 'package:flutter/material.dart';

class RecomendedPage extends StatefulWidget {
  RecomendedPage({Key key}) : super(key: key);

  @override
  _RecomendedPageState createState() => _RecomendedPageState();
}

class _RecomendedPageState extends State<RecomendedPage> {
  double width;

  Widget _header(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return ClipRRect(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
      child: Container(
          height: 120,
          width: width,
          decoration: BoxDecoration(
            color: LightColor.orange,
          ),
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                  top: 10,
                  right: -120,
                  child: _circularContainer(300, LightColor.lightOrange2)),
              Positioned(
                  top: -60,
                  left: -65,
                  child: _circularContainer(width * .5, LightColor.darkOrange)),
              Positioned(
                  top: -230,
                  right: -30,
                  child: _circularContainer(width * .7, Colors.transparent,
                      borderColor: Colors.white38)),
              Positioned(
                  top: 50,
                  left: 0,
                  child: Container(
                      width: width,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Stack(
                        children: <Widget>[IconButton(
                          icon: Icon(Icons.keyboard_arrow_left,
                          color: Colors.white,
                            size: 40,
                          ), 
                          onPressed: ()=>Navigator.pop(context)),
                    
                          Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Outbox",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w500),
                              ))
                        ],
                      ))),
            ],
          )),
    );
  }

  Widget _circularContainer(double height, Color color,
      {Color borderColor = Colors.transparent, double borderWidth = 2}) {
    return Container(
      height: height,
      width: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        border: Border.all(color: borderColor, width: borderWidth),
      ),
    );
  }

  Widget _categoryRow(String title) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 20),
      height: 68,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              title,
              style: TextStyle(
                  color: LightColor.extraDarkPurple,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              width: width,
              height: 30,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  SizedBox(width: 20),
                  _chip(
                    "Sent",
                    LightColor.yellow,
                    height: 5,
                  ),
                  SizedBox(width: 10),
                  _chip("Recieved", LightColor.seeBlue, height: 5),
                  SizedBox(width: 10),
                  _chip("Pending", LightColor.orange, height: 5),
                  SizedBox(width: 10),
                ],
              )),
          SizedBox(height: 10)
        ],
      ),
    );
  }

  Widget _courseList() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _courceInfo(CourseList.list[0],
                _decorationContainerA(Colors.redAccent, -110, -85),
                background: LightColor.seeBlue),
            Divider(
              thickness: 1,
              endIndent: 20,
              indent: 20,
            ),
            _courceInfo(CourseList.list[1], _decorationContainerB(),
                background: LightColor.airtelRed),
            Divider(
              thickness: 1,
              endIndent: 20,
              indent: 20,
            ),
            _courceInfo(CourseList.list[2], _decorationContainerC(),
                background: LightColor.safaricomGreen),
          ],
        ),
      ),
    );
  }

  Widget _card(
      {Color primaryColor = Colors.redAccent,
      String imgPath,
      Widget backWidget}) {
    return Container(
        height: 190,
        width: width * .34,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  offset: Offset(0, 5),
                  blurRadius: 10,
                  color: Color(0x12000000))
            ]),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          child: backWidget,
        ));
  }

  Widget _courceInfo(CourseModel model, Widget decoration, {Color background}) {
    return Container(
        height: 170,
        width: width - 20,
        child: Row(
          children: <Widget>[
            AspectRatio(
              aspectRatio: .7,
              child: _card(primaryColor: background, backWidget: decoration),
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 15),
                Container(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Expanded(
                        child: Text(model.name,
                            style: TextStyle(
                                color: LightColor.purple,
                                fontSize: 10,
                                fontWeight: FontWeight.bold)),
                      ),
                      CircleAvatar(
                        child: Icon(Icons.access_time, size: 10,color: background,),
                        radius: 5,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(model.noOfCource,
                          style: TextStyle(
                            color: LightColor.grey,
                            fontSize: 10,
                          )),
                      SizedBox(width: 10)
                    ],
                  ),
                ),
                Text(model.university,
                    style: AppTheme.h6Style.copyWith(
                      fontSize: 12,
                      color: LightColor.grey,
                    )),
                SizedBox(height: 15),
                Text(model.description,
                textAlign: TextAlign.center,
               //r overflow: TextOverflow.ellipsis,
                    style: AppTheme.h6Style.copyWith(
                        fontSize: 12, color: LightColor.extraDarkPurple)),
                SizedBox(height: 15),
                // Row(
                //   children: <Widget>[
                //     _chip(model.tag1, LightColor.darkOrange, height: 2),
                //     SizedBox(
                //       width: 10,
                //     ),
                //     // _chip(model.tag2, LightColor.seeBlue, height: 5),
                //   ],
                // ),
                _chip(model.tag2, LightColor.seeBlue, height: 5),
              ],
              
            ))
          ],
        ));
  }

  Widget _chip(String text, Color textColor,
      {double height = 0, bool isPrimaryCard = false}) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: height),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: textColor.withAlpha(isPrimaryCard ? 200 : 50),
      ),
      child: Text(
        text,
        style: TextStyle(
            color: isPrimaryCard ? Colors.white : textColor, fontSize: 12),
      ),
    );
  }

  Widget _decorationContainerA(Color primaryColor, double top, double left) {
    return Stack(
      children: <Widget>[
        Positioned(
            top: 85,
            left: 18,
            right: 5,
            child: Container(
                width: width,
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: Stack(
                  children: <Widget>[
                    Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Telkom",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ))
                  ],
                ))),
        Positioned(
          top: top,
          left: left,
          child: CircleAvatar(
            radius: 100,
            backgroundColor: LightColor.telkomBlue,
          ),
        ),
        _smallContainer(LightColor.yellow, 40, 20),
        Positioned(
          top: -30,
          right: -10,
          child: _circularContainer(80, Colors.transparent,
              borderColor: Colors.white),
        ),
        Positioned(
          top: 110,
          right: -50,
          child: CircleAvatar(
            radius: 60,
            backgroundColor: LightColor.telkomBlue,
            child:
                CircleAvatar(radius: 40, backgroundColor: LightColor.seeBlue),
          ),
        ),
      ],
    );
  }

  Widget _decorationContainerB() {
    return Stack(
      children: <Widget>[
        Positioned(
            top: 70,
            left: 20,
            right: 5,
            child: Container(
                width: width,
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Stack(
                  children: <Widget>[
                    Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Airtel",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ))
                  ],
                ))),
        Positioned(
          top: -65,
          left: -65,
          child: CircleAvatar(
            radius: 70,
            backgroundColor: LightColor.lightOrange2,
            child:
                CircleAvatar(radius: 30, backgroundColor: LightColor.airtelRed),
          ),
        ),
        Positioned(
            bottom: -35,
            right: -40,
            child: CircleAvatar(
                backgroundColor: LightColor.lightOrange2, radius: 40)),
        Positioned(
          top: 50,
          left: -40,
          child: _circularContainer(70, Colors.transparent,
              borderColor: Colors.white),
        ),
      ],
    );
  }

  Widget _decorationContainerC() {
    return Stack(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Positioned(
            top: 55,
            left: 2,
            right: 2,
            child: Container(
                width: width,
                padding: EdgeInsets.symmetric(horizontal: 1),
                child: Stack(
                  children: <Widget>[
                    Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Safaricom",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ))
                  ],
                ))),
            Positioned(
              bottom: -65,
              left: -35,
              child: CircleAvatar(
                  radius: 70, backgroundColor: LightColor.safaricomGreen2),
            ),
          ],
        ),
        Positioned(
          bottom: -65,
          left: -35,
          child: CircleAvatar(
              radius: 70, backgroundColor: LightColor.safaricomGreen2),
        ),
        Positioned(
            bottom: -35,
            right: -40,
            child: CircleAvatar(
                backgroundColor: LightColor.airtelRed, radius: 40)),
      ],
    );
  }

  Positioned _smallContainer(Color primaryColor, double top, double left,
      {double radius = 10}) {
    return Positioned(
        top: top,
        left: left,
        child: CircleAvatar(
          radius: radius,
          backgroundColor: primaryColor.withAlpha(255),
        ));
  }

  BottomNavigationBarItem _bottomIcons(IconData icon) {
    return BottomNavigationBarItem(
        //  backgroundColor: Colors.blue,
        icon: Icon(icon),
        title: Text(""));
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
      child: Column(
        children: <Widget>[
          _header(context),
          SizedBox(height: 20),
          _categoryRow("SMS Statuses"),
          _courseList()
        ],
      ),
    )));
  }
}
