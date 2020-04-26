import 'package:flutter/material.dart';
import 'package:ysociety/models/member.dart';
import 'package:ysociety/ui/pages/Services.dart';

class FamilyDetailScreen extends StatelessWidget {
  final Member member;

  const FamilyDetailScreen({Key key, this.member}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: const Color(0xFFE9E9E9),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: const Color(0xFF200087),
            expandedHeight: 300,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(60),
            )),
            flexibleSpace: FlexibleSpaceBar(
              background: ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(60),
                  ),
                  child: Image.asset(
                    member.imagepath,
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(height: 20,),
                ListTile(
                  trailing: Column(
                    children: <Widget>[
                      Text("Room No. ${member.roomno}",style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.w600,fontSize: 16,
                      ),),
                    ],
                  ),
                  title: Text(
                    //"Dater",
                    member.wing.toUpperCase(),
                    // "${thisInstant.day}/${month}/${thisInstant.year}",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Colors.blueGrey),
                  ),
                  subtitle: Text(
                    //"Dater",
                    member.name,
                    // "${thisInstant.day}/${month}/${thisInstant.year}",
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 24,
                        color: Colors.black),
                  ),

                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
