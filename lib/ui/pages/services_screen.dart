//import 'package:call_number/call_number.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ysociety/ui/pages/Services.dart';


class ServicesScreen extends StatelessWidget {
  final today = DateTime.now();

  _initCall() async {
    await launch("tel://9320711080");
    //await new CallNumber().callNumber('+919320711080' );
  }
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
      backgroundColor: const Color(0xFF200088),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 25.0, bottom: 18),
                child: IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 40,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              ListTile(
                trailing: Column(
                  children: <Widget>[
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        //IconButton(                          icon:
                          Icon(
                            Icons.call,
                            color: Colors.white30,
                            size: 18,
                          ),
                       // onPressed: (){
                        //    _MyAppState();
                        //},
                        //),

                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            "Call Now",
                            style: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 4),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(
                            Icons.line_style,
                            color: Colors.white30,
                            size: 16,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 6.0),
                            child: Text(
                              "Choose",
                              style: TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                title: Text(
                  //"Dater",
                  "${DateFormat("EEEE").format(today)}, ${DateFormat("d MMMM").format(today)}",
                  // "${thisInstant.day}/${month}/${thisInstant.year}",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.white),
                ),
                subtitle: Text(
                  //"Dater",
                  "Handy Services",
                  // "${thisInstant.day}/${month}/${thisInstant.year}",
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 24,
                      color: Colors.white),
                ),
              ),
              Divider(
                height: 20,
              ),
              for (int i = 0; i < services.length; i++)
                Column(
                  children: <Widget>[
                    for (int j = 0; j < services.length; j++)
                      ListTile(
                        leading: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20)),
                            color: const Color(0xFF354180),
                          ),
                          child: IconButton(
                            icon: services[i][j].imagePath,
                            onPressed: ()
                            {
                                _initCall();
                            },
                          ),
                        ),
                        title: Text(services[i][j].name,style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w600),),
                        subtitle: Text(services[i][j].instruction,style: TextStyle(color: Colors.white60,fontSize: 12,fontWeight: FontWeight.w300),),
                      ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
