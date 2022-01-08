// ignore_for_file: deprecated_member_use

import 'package:bmi_app/pages/bmi_result.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'bmi_result.dart';

class BMIPage extends StatefulWidget {
  const BMIPage({Key? key}) : super(key: key);

  @override
  _BMIPageState createState() => _BMIPageState();
}

class _BMIPageState extends State<BMIPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _weight = TextEditingController();
  final TextEditingController _height = TextEditingController();
  String _result = "0";
  String _problem = "0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI'),
        backgroundColor: Colors.brown,
      ),
      body: Center(
        // decoration: const BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage('images/white1.jfif'),
        //     fit: BoxFit.cover,
        //   ),
        // ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'BMI Calculator',
              style: TextStyle(fontSize: 30),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 14),
                  weight(),
                  const SizedBox(height: 5),
                  height(),
                  button(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding button(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ButtonTheme(
            height: 50,
            minWidth: 280,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            buttonColor: Colors.amber,
            child: RaisedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  print(_weight.text);
                  print(_height.text);
                }
                setState(
                  () {
                    //BMI สูตรการคำนวณ = น้ำหนักตัว(Kg) / (ส่วนสูง(m) ยกกำลังสอง)
                    var _heightM = double.parse(_height.text) /
                        100; //ประกาศตัวแปร _heightM มารับค่าส่วนสูง cm แปลงเป็น m
                    var _bmi =
                        double.parse(_weight.text) / (_heightM * _heightM);
                    _result = _bmi.toStringAsFixed(3);
                    if (_bmi > 40) {
                      _result = "อ้วนมากกกกกกกก";
                      _problem = "อันตรายมากที่สุด";
                    } else if (_bmi >= 30) {
                      _result = "อ้วนมาก";
                      _problem = "อันตรายระดับ 3";
                    } else if (_bmi >= 25) {
                      _result = "อ้วน";
                      _problem = "อันตรายระดับ 2";
                    } else if (_bmi >= 23) {
                      _result = "เริ่มท้วมแล้วนะ";
                      _problem = "อันตรายระดับ 1";
                    } else if (_bmi >= 18.6) {
                      _result = "สุขภาพดี";
                      _problem = "เท่าคนปกติ";
                    } else {
                      _result = "น้ำหนักคุณน้อยเกินไปแล้ว";
                      _problem = "มากกว่าคนปกติ";
                    }
                    var route = MaterialPageRoute(
                      builder: (context) => CALBMIPage(
                        result: _result,
                        weight: _weight.text,
                        height: _height.text,
                        problem: _problem,
                        bmi: _bmi.toStringAsFixed(2),
                      ),
                    );
                    Navigator.push(context, route);
                  },
                );
              },
              child: const Text(
                'คำนวณ',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox height() {
    return SizedBox(
      width: 280,
      child: TextFormField(
        controller: _height,
        validator: (value) {
          if (value!.isEmpty) {
            return 'โปรดระบุส่วนสูง!';
          }
          return null;
        },
        maxLength: 3,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          label: Text(
            'ระบุส่วนสูง (cm)',
            style: TextStyle(color: Colors.blueGrey),
          ),
          prefixIcon: Icon(
            Icons.height_rounded,
            color: Colors.blueGrey,
          ),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(32),
              ),
              borderSide: BorderSide(
                color: Colors.redAccent,
                width: 2,
              )),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(32),
            ),
            borderSide: BorderSide(
              color: Colors.brown,
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(32),
            ),
            borderSide: BorderSide(
              color: Colors.brown,
              width: 2,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(32),
            ),
            borderSide: BorderSide(
              color: Colors.red,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }

  SizedBox weight() {
    return SizedBox(
      width: 280,
      child: TextFormField(
        controller: _weight,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'โปรดระบุน้ำหนัก!';
          }
          return null;
        },
        maxLength: 3,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          label: Text(
            'ระบุน้ำหนัก (kg)',
            style: TextStyle(color: Colors.blueGrey),
          ),
          prefixIcon: Icon(
            Icons.add_chart_rounded,
            color: Colors.blueGrey,
          ),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(32),
              ),
              borderSide: BorderSide(
                color: Colors.redAccent,
                width: 2,
              )),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(32),
            ),
            borderSide: BorderSide(
              color: Colors.brown,
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(32),
            ),
            borderSide: BorderSide(
              color: Colors.brown,
              width: 2,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(32),
            ),
            borderSide: BorderSide(
              color: Colors.red,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
