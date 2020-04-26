import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ysociety/models/member.dart';
import 'package:vector_math/vector_math_64.dart' as math;
import 'package:ysociety/ui/pages/familydetailscreen.dart';
import 'package:ysociety/ui/pages/services_screen.dart';
import 'MyFlutterApp.dart';
import 'package:intl/intl.dart';

import 'package:url_launcher/url_launcher.dart';

//import 'package:call_number/call_number.dart';
class ProfileScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final today = DateTime.now();

    _initCall() async {
      await launch("tel://9320711080");
      //await new CallNumber().callNumber('+919320711080' );
    }
    // TODO: implement build
    return Scaffold(
      backgroundColor: const Color(0xFFE9E9E9),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: BottomNavigationBar(
          iconSize: 30,
          unselectedIconTheme: IconThemeData(color: Colors.black12),
          selectedIconTheme: IconThemeData(
            color: const Color(0xFF200087),
          ),
          currentIndex: 0,
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Icon(Icons.home)),
              title: Text(
                "HOME",
                style: TextStyle(color: Colors.white),
              ),
            ),
            BottomNavigationBarItem(
              icon: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Icon(Icons.search)),
              title: Text(
                "EXPLORE",
                style: TextStyle(color: Colors.white),
              ),
            ),
            BottomNavigationBarItem(
              title: Text(
                "PROFILE",
                style: TextStyle(color: Colors.white),
              ),
              icon: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Icon(Icons.person)),
            ),
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            height: height * 0.366,
            left: 0,
            right: 0,
            child: ClipRRect(
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.only(
                  top: 25,
                  left: 22,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        //"Dater",
                        "${DateFormat("EEEE").format(today)}, ${DateFormat("d MMMM").format(today)}",
                        // "${thisInstant.day}/${month}/${thisInstant.year}",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: Colors.black38),
                      ),
                      subtitle: Text(
                        "Hello! SAGAR",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: Colors.black),
                      ),
                      trailing: ClipOval(
                        child: Image.asset("assets/sagar.jpg"),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        _RadialProgress(
                          width: width * 0.4,
                          height: width * 0.4,
                          progress: 0.6,
                        ),
                        SizedBox(
                            height: 10,
                           width: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            _NotiProgress(
                              call: "Visitors",
                              progress: 0.3,
                              progressColor: Colors.green,
                              leftAmount: 10,
                              width: width * .38,
                            ),
                            Divider(),
                            _NotiProgress(
                              call: "Delivery",
                              progress: 0.2,
                              progressColor: Colors.red,
                              leftAmount: 101,
                              width: width * .38,
                            ),
                            Divider(),
                            _NotiProgress(
                              call: "Reception",
                              progress: 0.1,
                              progressColor: Colors.yellow,
                              leftAmount: 110,
                              width: width * .38,
                            ),
                          ],
                        ),
                        //  SizedBox(
                        // height: 10,
                        // width: 5,
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
              borderRadius: const BorderRadius.vertical(
                bottom: const Radius.circular(40),
              ),
            ),
          ),
          Positioned(
            top: height * 0.38,
            left: 0,
            right: 0,
            child: Container(
              height: height * 0.6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 8.0, left: 32, right: 16),
                    child: Text(
                      "NEIGHBOURS",
                      style: const TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: 32,
                          ),
                          for (int i = 0; i < members.length - 1; i++)
                            _MemberCard(member: members[i]),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: OpenContainer(
                      transitionDuration: const Duration(milliseconds: 550),
                      transitionType: ContainerTransitionType.fadeThrough,
                      closedElevation: 10,
                      closedColor: const Color(0xFFE9E9E9),
                      openBuilder: (context,_){
                        return ServicesScreen();
                      },
                      closedBuilder: (context, VoidCallback openContainer){
                        return  GestureDetector(
                          onTap: openContainer,
                          child: Container(
                            margin: const EdgeInsets.only(
                                left: 22, right: 22, top: 12, bottom: 12),
                            decoration: BoxDecoration(
                              borderRadius:
                              const BorderRadius.all(const Radius.circular(20)),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  const Color(0xFF200089),
                                  const Color(0xFF0A2D5B),
                                ],
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left: 14.0, top: 20),
                                  child: Text(
                                    "Services",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 14.0, top: 4, bottom: 5),
                                  child: Text(
                                    "Call now",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 35,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(vertical: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                          color: const Color(0xFF354180),
                                        ),
                                        child: IconButton(
                                          icon: Icon(
                                            MyFlutterApp.power,
                                            color: Colors.white,
                                            size: 30.0,
                                          ),
                                          onPressed: () {
                                            _initCall();
                                          },
                                        ),
                                      ),
                                      // SizedBox(width: 10,),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                          color: const Color(0xFF354180),
                                        ),
                                        child: IconButton(
                                          icon: Icon(
                                            MyFlutterApp.room_service,
                                            color: Colors.white,
                                            size: 30.0,
                                          ),
                                          onPressed: () {
                                            _initCall();
                                          },
                                        ),
                                      ),
                                      //   SizedBox(width: 10,),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                          color: const Color(0xFF354180),
                                        ),
                                        child: IconButton(
                                          icon: Icon(
                                            MyFlutterApp.local_laundry_service,
                                            color: Colors.white,
                                            size: 30.0,
                                          ),
                                          onPressed: () {
                                            _initCall();
                                          },
                                        ),
                                      ),
                                      //  SizedBox(width: 10,),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                          color: const Color(0xFF354180),
                                        ),
                                        child: IconButton(
                                          icon: Icon(
                                            MyFlutterApp.more_horiz,
                                            color: Colors.white,
                                            size: 30.0,
                                          ),
                                          onPressed: () {
                                            _initCall();
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },

                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MemberCard extends StatelessWidget {
  final Member member;

  const _MemberCard({Key key, @required this.member}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FamilyDetailScreen(member: member,),),);
        },
      child: Container(
          margin: const EdgeInsets.only(right: 17, bottom: 10),
          child: Material(
            borderRadius: const BorderRadius.all(const Radius.circular(20)),
            elevation: 9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Flexible(
                  fit: FlexFit.tight,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    child: Image.asset(member.imagepath,
                        width: 150, fit: BoxFit.fitWidth),
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          member.wing,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Colors.blueGrey,
                          ),
                        ),
                        Text(
                          member.name,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 17,
                            color: Colors.blueGrey,
                          ),
                        ),
                        Text(
                          member.mno,
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 4),
                        Text(
                          "Room No: ${member.roomno}",
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 10,
                            color: Colors.blueGrey,
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

class _RadialProgress extends StatelessWidget {
  final double height, width, progress;

  const _RadialProgress({Key key, this.height, this.width, this.progress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CustomPaint(
      painter: _RadialPainter(progress: progress),
      child: Container(
        height: height,
        width: width,
        child: Center(
          child: RichText(
            text: TextSpan(children: [
              TextSpan(
                text: "Paid",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF200087),
                ),
              ),
              TextSpan(
                text: "\n",
              ),
              TextSpan(
                text: "Maintainence",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF200087),
                ),
              ),
            ]),
          ),
        ),
        color: Colors.transparent,
      ),
    );
  }
}

class _RadialPainter extends CustomPainter {
  final double progress;

  _RadialPainter({this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    Paint paint = Paint()
      ..strokeWidth = 9
      ..color = Color(0xFF200087)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / 2, size.height / 2);
    double relativeProgress = 360 * progress;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: size.width / 2),
      math.radians(-90),
      math.radians(-relativeProgress),
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}

class _NotiProgress extends StatelessWidget {
  final String call;
  final int leftAmount;
  final double progress, width;
  final Color progressColor;

  const _NotiProgress(
      {Key key,
      this.call,
      this.leftAmount,
      this.progress,
      this.progressColor,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          call.toUpperCase(),
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 9.4,
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Colors.black12,
                  ),
                ),
                Container(
                  height: 10,
                  width: width*progress,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: progressColor,
                  ),
                )
              ],
            ),
            SizedBox(
              width: 10,
            ),
            // Text("Recieved"),
          ],
        ),
      ],
    );
  }
}
