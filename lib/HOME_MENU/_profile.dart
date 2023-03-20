import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  late String email;
  late String phone;
  late String first;
  late String last;
  late String image;
  Profile({
    required this.email,
    required this.phone,
    required this.first,
    required this.last,
    required this.image,
  });

  @override
  State<Profile> createState() => _ProfileState(
        email,
        phone,
        first,
        last,
        image,
      );
}

class _ProfileState extends State<Profile> {
  late String email;
  late String phone;
  late String first;
  late String last;
  late String image;

  _ProfileState(
    this.email,
    this.phone,
    this.first,
    this.last,
    this.image,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ข้อมูลผู้ติดต่อ',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.blueGrey[800],
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                child: Stack(
                  children: [
                    Container(
                      /// color: Colors.blueAccent,
                      child: SizedBox(
                        width: 120,
                        height: 120,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: image == null
                                ? Container()
                                : Image.network(
                                    '${image}',
                                    fit: BoxFit.fill,
                                  )),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '$first}',
                        style: TextStyle(
                            color: Colors.grey[900],
                            fontWeight: FontWeight.w500,
                            fontSize: 20),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '$last',
                        style: TextStyle(
                            color: Colors.grey[900],
                            fontWeight: FontWeight.w500,
                            fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Container(
                    child: Center(
                      child: Text(
                        'เบอร์โทรศัพท์ : ',
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Center(
                      child: Text(
                        '$phone',
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontWeight: FontWeight.w600,
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
                children: [

                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 30,
                          width: 300,
                          child: Text(
                            'อีเมล : $email',
                            style: TextStyle(
                              color: Colors.grey[800],
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
