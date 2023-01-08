import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  //CollectionReference employe=FirebaseFirestore.instance.collection("employe");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employees'),
        backgroundColor: Color.fromARGB(255, 31, 73, 107),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                // decoration:
                //     BoxDecoration(borderRadius: BorderRadius.circular(10), ),
                width: 330.w,
                height: 40.h,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(fontSize: 12.sp),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r)),
                  ),
                )),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection('employe').snapshots(),
              builder: (context, snapshots) {
                if (!snapshots.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshots.data!.docs.isEmpty) {
                  return Center(child: Text("no items"));
                } else {
                  ListView.builder(
                     
                      itemCount: snapshots.data!.docs.length,
                      itemBuilder: (context, index) {
                        var data = snapshots.data!.docs[index].data()
                            as Map<String, dynamic>;

                        return Container(
                          child: Text(data["experience".toString()]),
                        );
                      });
                }
                return ListView.builder(
                    
                    itemCount: snapshots.data!.docs.length,
                    itemBuilder: (context, index) {
                      var data = snapshots.data!.docs[index].data()
                          as Map<String, dynamic>;

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: double.infinity,
                          // height: 140,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.grey, blurRadius: 10)
                              ]),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                    data['image'],
                                  ),
                                  maxRadius: 28,
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 140.w,
                                    child: Text(
                                      data['name'].toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Text('age:${data['age']}'),
                                  Text('Possition:${data['possition']}')
                                ],
                              ),
                              SizedBox(
                                width: 75.w,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${data['organisation']}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                        'Experiance:${data['experience']} Years')
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Icon(
                                Icons.flag,
                                color: data['experience'] > 5
                                    ? Color.fromARGB(255, 2, 240, 14)
                                    : Colors.grey,
                                shadows: [
                                  BoxShadow(color: Colors.grey, blurRadius: 10)
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              },
            ),
          ),
        ],
      ),
    );
  }
}
