import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:employe_project/model/employe_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  //CollectionReference employe=FirebaseFirestore.instance.collection("employe");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('HomePage'),
        ),
        body: StreamBuilder<List<EmployeDataModel>>(
          stream: readUser(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final users = snapshot.data!;
              return ListView(children: users.map(buildUser).toList());
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        )

        //  StreamBuilder<QuerySnapshot>(
        //   stream: FirebaseFirestore.instance.collection('employe').snapshots(),
        //   builder: (context, snapshots) {
        //     if (!snapshots.hasData) {
        //       return Center(
        //         child: CircularProgressIndicator(),
        //       );
        //     }
        //     if (snapshots.data!.docs.isEmpty) {
        //       return Center(child: Text("no items"));
        //     } else {
        //       ListView.builder(
        //           semanticChildCount: 1,

        //           // shrinkWrap: true,
        //           itemCount: snapshots.data!.docs.length,
        //           itemBuilder: (context, index) {
        //             var data = snapshots.data!.docs[index].data()
        //                 as Map<String, dynamic>;

        //             return Container(
        //               child: Text(data["experience"]),
        //             );
        //           });
        //     }
        //     return ListView.builder(
        //           semanticChildCount: 1,

        //           // shrinkWrap: true,
        //           itemCount: snapshots.data!.docs.length,
        //           itemBuilder: (context, index) {
        //             var data = snapshots.data!.docs[index].data()
        //                 as Map<String, dynamic>;

        //             return Container(
        //               child: Text(data["experience"]),
        //             );
        //           });
        //   },
        // ),

        // body: StreamBuilder(
        //   stream: FirebaseFirestore.instance.collection("employe").snapshots(),
        //   builder: (context,
        //       AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        //     if (!snapshot.hasData) {
        //       return Center(child: CircularProgressIndicator());
        //     } else if (snapshot.data!.docs.isEmpty) {
        //       return Text('empty');
        //     } else {
        //       return ListView.builder(
        //         itemCount: snapshot.data!.docs.length,
        //         itemBuilder: (context, index) {
        //           EmployeDataModel employe = EmployeDataModel.getModelFromJson(
        //               json: snapshot.data!.docs[index].data());
        //           return Container(
        //             child: Text(employe.name.toString()),
        //           );
        //         },
        //       );
        //     }
        //   },
        // ),
        );
  }
}

Stream<List<EmployeDataModel>> readUser() => FirebaseFirestore.instance
    .collection("employe")
    .snapshots()
    .map((snapshot) => snapshot.docs.map((doc) => EmployeDataModel()).toList());
Widget buildUser(EmployeDataModel user) => Container(
      child: Text(user.name.toString()),
    );
