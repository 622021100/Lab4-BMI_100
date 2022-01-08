// ignore_for_file: deprecated_member_use

import 'package:bmi_app/pages/bmi_main.dart';
import 'package:flutter/material.dart';

class CALBMIPage extends StatefulWidget {
  const CALBMIPage(
      {Key? key, this.weight, this.height, this.result, this.bmi, this.problem})
      : super(key: key);

  final String? weight;
  final String? height;
  final String? result;
  final String? bmi;
  final String? problem;

  @override
  _CALBMIPageState createState() => _CALBMIPageState();
}

class _CALBMIPageState extends State<CALBMIPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
        backgroundColor: Colors.brown,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/white1.jfif'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'ผลการคำนวณหาค่า BMI',
              style: TextStyle(fontSize: 25),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  card2(),
                  card3(),
                ],
              ),
            ),
            card(),
            card1(),
            ButtonTheme(
              minWidth: 330,
              height: 50,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32)),
              buttonColor: Colors.amber,
              child: RaisedButton(
                onPressed: () {
                  var route = MaterialPageRoute(
                    builder: (context) => const BMIPage(),
                  );
                  Navigator.pop(context, route);
                },
                child: const Text(
                  'กลับ',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container card3() {
    return Container(
      margin: const EdgeInsets.all(0),
      height: 170,
      width: 170,
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Card(
          color: Colors.brown[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('ส่วนสูง'),
              Text(
                widget.height!,
                style: const TextStyle(fontSize: 30, color: Colors.white),
              ),
              const Text('cm'),
            ],
          ),
        ),
      ),
    );
  }

  Container card2() {
    return Container(
      margin: const EdgeInsets.all(0),
      height: 170,
      width: 170,
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Card(
          color: Colors.brown[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('น้ำหนัก'),
              Text(
                widget.weight!,
                style: const TextStyle(fontSize: 30, color: Colors.white),
              ),
              const Text('kg'),
            ],
          ),
        ),
      ),
    );
  }

  Container card1() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
      height: 130,
      width: 350,
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Card(
          color: Colors.brown[100],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.result!,
                style: const TextStyle(fontSize: 30),
              ),
              Text(
                'ภาวะเสี่ยงต่อโรค :' + ' ' + widget.problem!,
                style: const TextStyle(fontSize: 13, color: Colors.red),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container card() {
    return Container(
      margin: const EdgeInsets.all(0),
      height: 150,
      width: 350,
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Card(
          color: Colors.brown[100],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('ค่า BMI'),
              Text(
                widget.bmi!,
                style: const TextStyle(fontSize: 50),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
