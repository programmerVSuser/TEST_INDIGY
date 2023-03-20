import 'dart:convert';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '_profile.dart';

class HomeMenuProduct extends StatefulWidget {
  const HomeMenuProduct({Key? key}) : super(key: key);

  @override
  State<HomeMenuProduct> createState() => _HomeMenuProductState();
}

class _HomeMenuProductState extends State<HomeMenuProduct> {
  List<Widget> WidgetProduct = [];
  List<void> ProductResults = [];

  Map<String, dynamic> jsonResponse = {};
  Map<String, dynamic> snap_results = {};
  Map<String, dynamic> snap_sub_dob = {};

  Map<String, dynamic> get map0 => jsonResponse;
  Map<String, dynamic> get map1 => jsonResponse;
  Map<String, dynamic> get DOB => snap_results;
  Map<String, dynamic> get ID => snap_results;
  Map<String, dynamic> get REGISTERED => snap_results;
  Map<String, dynamic> get PICTURE => snap_results;
  Map<String, dynamic> get LOCATION => snap_results;
  Map<String, dynamic> get LOGIN => snap_results;
  Map<String, dynamic> get NAME => snap_results;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ReadData();
  }

  void ReadData() async {
    if (WidgetProduct != null) {
      _data_api();
    } else {}
  }

  Future<void> _data_api() async {
    final response =
        await http.get(Uri.parse('https://randomuser.me/api/?results=100'));
    jsonResponse = jsonDecode(response.body);

    if (response.statusCode == 200) {
      print('response ====== ${response}');
      print('jsonResponse  ====== ${jsonResponse}');
      print(jsonResponse);
      print("MAP-----${map0}");
      int indexs = 0;
      for (snap_results in map0['results']) {
        print(
            '************************* Snap Results ${indexs} **************************************');
        print(snap_results);
        print(indexs++);
        setState(() {
          ///SUB DATA 1
          var cell = snap_results['cell'];

          print("${snap_results['cell']}");
          print(DOB['dob']);
          print("${snap_results['email']}");
          print("${snap_results['gender']}");
          print(ID['id']);
          print(LOCATION['location']);
          print(LOGIN['login']);
          print(NAME['name']);
          print("${snap_results['nat']}");
          print("${snap_results['phone']}");
          print(PICTURE['picture']);
          print("${snap_results['name']}");
          print(REGISTERED['registered']);

          ///SUB DATA 2
          print('------- SUB DOB --------');

          print(DOB['dob']);
          var SUB_DOB = DOB['dob'];
          print(SUB_DOB['age']);
          print(SUB_DOB['date']);

          print('------- SUB ID --------');
          print(ID['id']);
          var SUB_ID = ID['id'];
          print(SUB_ID['name']);
          print(SUB_ID['value']);

          print('------- SUB LOCATION --------');
          print(LOCATION['location']);
          var SUB_LOCATION = LOCATION['location'];
          print(SUB_LOCATION['city']);
          print(SUB_LOCATION['coordinates']);
          print(SUB_LOCATION['country']);
          print(SUB_LOCATION['postcode']);
          print(SUB_LOCATION['state']);
          print(SUB_LOCATION['street']);
          print(SUB_LOCATION['timezone']);

          print('------- SUB LOGIN --------');
          print(LOGIN['login']);
          var SUB_LOGIN = LOGIN['login'];
          print(SUB_LOGIN['md5']);
          print(SUB_LOGIN['password']);
          print(SUB_LOGIN['salt']);
          print(SUB_LOGIN['sha1']);
          print(SUB_LOGIN['sha256']);
          print(SUB_LOGIN['username']);
          print(SUB_LOGIN['uuid']);

          print('------- SUB NAME --------');
          print(NAME['name']);
          var SUB_NAME = NAME['name'];
          print(SUB_NAME['first']);
          print(SUB_NAME['last']);
          print(SUB_NAME['title']);

          print('------- SUB PICTURE --------');
          print(PICTURE['picture']);
          var SUB_PICTURE = PICTURE['picture'];
          print(SUB_PICTURE['large']);
          print(SUB_PICTURE['medium']);
          print(SUB_PICTURE['thumbnail']);

          print('------- SUB REGISTERED --------');
          print(REGISTERED['registered']);
          var SUB_REGISTERED = REGISTERED['registered'];
          print(SUB_REGISTERED['age']);
          print(SUB_REGISTERED['date']);

          ///SUB DATA 3
          print('------- SUB LOCATION COORDINATES --------');
          print(SUB_LOCATION['coordinates']);
          var SUB_LOCATION_COORDINATES = SUB_LOCATION['coordinates'];
          print(SUB_LOCATION_COORDINATES['latitude']);
          print(SUB_LOCATION_COORDINATES['longitude']);

          print('------- SUB LOCATION STREET --------');
          print(SUB_LOCATION['street']);
          var SUB_LOCATION_STREET = SUB_LOCATION['street'];
          print(SUB_LOCATION_STREET['name']);
          print(SUB_LOCATION_STREET['number']);

          print('------- SUB LOCATION TIMEZONE --------');
          print(SUB_LOCATION['timezone']);
          var SUB_LOCATION_TIMEZONE = SUB_LOCATION['timezone'];
          print(SUB_LOCATION_TIMEZONE['description']);
          print(SUB_LOCATION_TIMEZONE['offset']);

          WidgetProduct.add(WidgetProductUI(
            snap_results,
            SUB_NAME,
            SUB_PICTURE,
            indexs,
          ));
        });
      }

      ///infodata
      var info = map1['info'];
      print("info----------${info}");
      print("info----------${info}");
      print("info----------${info}");
      print(info['seed']);
      print(info['results']);
      print(info['page']);
      print(info['version']);
    }
  }

  Widget WidgetProductUI(
          var snap_resultsvar, SUB_NAME, var SUB_PICTURE, int indexs) =>
      GestureDetector(
        onTap: () {
          print(snap_resultsvar['email']);
          print(snap_resultsvar['phone']);
          print(SUB_NAME['first']);
          print(SUB_NAME['last']);
          print(SUB_PICTURE['large']);
          print(indexs);

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Profile(
                      email: snap_resultsvar['email'],
                      phone: snap_resultsvar['phone'],
                      first: SUB_NAME['first'],
                      last: SUB_NAME['last'],
                      image: SUB_PICTURE['medium'])));
        },
        child: Container(
          padding: EdgeInsets.only(left: 15, right: 15, top: 10),
          width: double.infinity,
          child: Row(
            children: [
              ///image profile
              Stack(
                children: [
                  Container(
                    /// color: Colors.blueAccent,
                    child: SizedBox(
                      width: 70,
                      height: 70,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: SUB_PICTURE['medium'] == null
                              ? Container()
                              : Image.network(
                                  '${SUB_PICTURE['medium']}',
                                  fit: BoxFit.fill,
                                )),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 10,
              ),

              ///detail
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Center(
                        child: Row(
                          children: [
                            Text(
                              '${SUB_NAME['first']}',
                              style: TextStyle(
                                color: Colors.grey[900],
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '${SUB_NAME['last']}',
                              style: TextStyle(
                                color: Colors.grey[900],
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Container(
                          child: Center(
                            child: Text(
                              '${snap_results['phone']}',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height:30,width: 200,
                              child: Text(
                              '${snap_results['email']}',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'รายชื่อผู้ติดต่อ',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.blueGrey[800],
        centerTitle: true,
      ),
      body: Container(
        child: Container(
            child: WidgetProduct.length == 0
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                      ],
                    ),
                  )
                : SingleChildScrollView(
                    child: Container(
                      child: Center(
                        child: Column(
                          children: WidgetProduct,
                        ),
                      ),
                    ),
                  )),
      ),
    );
  }
}
