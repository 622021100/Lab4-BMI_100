import 'package:flutter/material.dart';

import 'bmi_main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/white3.jfif'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              menuHeader(),
              welcomeText(),
              bottomBtn(),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox bottomBtn() {
    return SizedBox(
      width: 230,
      height: 80,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            var route = MaterialPageRoute(
              builder: (context) => const BMIPage(),
            );
            Navigator.push(context, route);
          },
          child: const Text(
            'เริ่มต้นใช้งาน',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(Colors.brown[600]),
            foregroundColor: MaterialStateProperty.all(Colors.blue),
          ),
        ),
      ),
    );
  }

  Column welcomeText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'ยินดีต้อนรับเข้าสู่',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.brown,
            wordSpacing: 15,
          ),
        ),
        Text(
          'แอปพลิเคชันคำนวณหาค่า BMI',
          style: TextStyle(
            fontSize: 25,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Row menuHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.help),
          label: const Text(
            'ความช่วยเหลือ',
            style: TextStyle(color: Colors.brown),
          ),
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.brown),
          ),
        ),
        Container(
          width: 2,
          height: 20,
          color: Colors.brown,
        ),
        TextButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.info),
          label: const Text(
            'เกี่ยวกับแอป',
            style: TextStyle(color: Colors.brown),
          ),
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.brown),
          ),
        ),
      ],
    );
  }
}
