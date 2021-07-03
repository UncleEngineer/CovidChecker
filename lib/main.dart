import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:intl/intl.dart'; // number formater

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  //const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // "Confirmed":254515,"Recovered":205064,"Hospitalized":47481,"Deaths":1970,
  // "NewConfirmed":4662,"NewRecovered":2793,"NewHospitalized":1833,"NewDeaths":36,"UpdateDate":"29\/06\/2021 12:13"
  var confirmed = TextEditingController(); // ตัวแปรสำหรับเก็บยอดติดเชื้อสะสม
  var recovered = TextEditingController();
  var hospitalized = TextEditingController();
  var deaths = TextEditingController();
  var newConfirmed = TextEditingController();
  var newRecovered = TextEditingController();
  var newHospitalized = TextEditingController();
  var newDeaths = TextEditingController();
  var updateDate = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    confirmed.text = '-';
    recovered.text = '-';
    hospitalized.text = '-';
    deaths.text = '-';
    newConfirmed.text = '-';
    newRecovered.text = '-';
    newHospitalized.text = '-';
    newDeaths.text = '-';
    updateDate.text = '-';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Covid Checker'),
        actions: [
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                print('Get Data Covid');
                _GetCovidData();
              })
        ],
      ),
      body: ListView(
        children: [
          // ช่องว่าง
          SizedBox(
            height: 30,
          ),
          // title1
          Center(
            child: Text(
              'ติดเชื้อสะสม',
              style: TextStyle(fontSize: 20),
            ),
          ),
          // result1
          Center(
            child: Text(
              confirmed.text,
              style: TextStyle(fontSize: 25, color: Colors.orange),
            ),
          ),
          // #2
          Center(
            child: Text(
              'หายแล้ว',
              style: TextStyle(fontSize: 20),
            ),
          ),
          // result1
          Center(
            child: Text(
              recovered.text,
              style: TextStyle(fontSize: 25, color: Colors.green),
            ),
          ),
          // #3
          Center(
            child: Text(
              'รักษาอยู่ใน รพ.',
              style: TextStyle(fontSize: 20),
            ),
          ),
          // result1
          Center(
            child: Text(
              hospitalized.text,
              style: TextStyle(fontSize: 25, color: Colors.blue),
            ),
          ),
          // #4
          Center(
            child: Text(
              'เสียชีวิต',
              style: TextStyle(fontSize: 20),
            ),
          ),
          // result1
          Center(
            child: Text(
              deaths.text,
              style: TextStyle(fontSize: 25, color: Colors.red),
            ),
          ),
          // #5
          Center(
            child: Text(
              'ติดเชื้อเพิ่ม',
              style: TextStyle(fontSize: 20),
            ),
          ),
          // result1
          Center(
            child: Text(
              newConfirmed.text,
              style: TextStyle(fontSize: 25, color: Colors.orange[200]),
            ),
          ),
          // #6
          Center(
            child: Text(
              'หายป่วยเพิ่ม',
              style: TextStyle(fontSize: 20),
            ),
          ),
          // result1
          Center(
            child: Text(
              newRecovered.text,
              style: TextStyle(fontSize: 25, color: Colors.green[200]),
            ),
          ),
          // #7
          Center(
            child: Text(
              'เข้ารักษาใน รพ.เพิ่ม',
              style: TextStyle(fontSize: 20),
            ),
          ),
          // result1
          Center(
            child: Text(
              newHospitalized.text,
              style: TextStyle(fontSize: 25, color: Colors.blue[200]),
            ),
          ),
          // #8
          Center(
            child: Text(
              'เสียชีวิตเพิ่ม',
              style: TextStyle(fontSize: 20),
            ),
          ),
          // result1
          Center(
            child: Text(
              newDeaths.text,
              style: TextStyle(fontSize: 25, color: Colors.red[200]),
            ),
          ),
          // #9
          Center(
            child: Text(
              'ข้อมูลล่าสุด',
              style: TextStyle(fontSize: 20),
            ),
          ),
          // result1
          Center(
            child: Text(
              updateDate.text,
              style: TextStyle(fontSize: 20),
            ),
          ),
          Center(
            child: SizedBox(
              height: 50,
            ),
          ),
          // title1
          Center(
            child: Text(
              'Dev by: Uncle Engineer \nData: https://covid19.th-stat.com/json/covid19v2/getTodayCases.json',
              style: TextStyle(fontSize: 10),
            ),
          ),
        ],
      ),
    );
  }

  /*
  confirmed.text = '-';
    recovered.text = '-';
    hospitalized.text = '-';
    deaths.text = '-';
    newConfirmed.text = '-';
    newRecovered.text = '-';
    newHospitalized.text = '-';
    newDeaths.text = '-';
    updateDate.text = '-';

  */

  // https://covid19.th-stat.com/json/covid19v2/getTodayCases.json
  Future _GetCovidData() async {
    var url =
        Uri.https('covid19.th-stat.com', '/json/covid19v2/getTodayCases.json');

    var response = await http.get(url);
    print('------DATA------');
    print(response.body);

    var result = json.decode(response.body);

    // "Confirmed":254515,"Recovered":205064,"Hospitalized":47481,"Deaths":1970,
    // "NewConfirmed":4662,"NewRecovered":2793,"NewHospitalized":1833,"NewDeaths":36,"UpdateDate":"29\/06\/2021 12:13"

    var v1 = result['Confirmed'];
    var v2 = result['Recovered'];
    var v3 = result['Hospitalized'];
    var v4 = result['Deaths'];
    var v5 = result['NewConfirmed'];
    var v6 = result['NewRecovered'];
    var v7 = result['NewHospitalized'];
    var v8 = result['NewDeaths'];
    var v9 = result['UpdateDate'];

    var formatter = NumberFormat('###,###,###'); // 145,135,145
    setState(() {
      confirmed.text = formatter.format(v1); // int.parse(v1) if v1 is string
      recovered.text = formatter.format(v2);
      hospitalized.text = formatter.format(v3);
      deaths.text = formatter.format(v4);
      newConfirmed.text = formatter.format(v5);
      newRecovered.text = formatter.format(v6);
      newHospitalized.text = formatter.format(v7);
      newDeaths.text = formatter.format(v8);
      updateDate.text = v9;
    });
  }
}
