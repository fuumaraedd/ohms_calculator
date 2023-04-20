import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  TextEditingController voltageController = TextEditingController();
  TextEditingController currentController = TextEditingController();
  TextEditingController resistanceController = TextEditingController();
  double resistance = 0.0;
  final player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 234, 234, 234),
      appBar: AppBar(
          title: const Text('OHMS CALCULATOR',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 24,
                color: Color.fromARGB(255, 255, 255, 255),
                fontFamily: 'Poppins',
              )),
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          shadowColor: const Color.fromARGB(255, 155, 155, 155),
          centerTitle: true,
          toolbarHeight: 65,
          toolbarOpacity: 0.5),
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          children: [
            Image.asset('assets/images/logo.png', scale: 2.5),
            Padding(
              padding: const EdgeInsets.fromLTRB(70, 5, 70, 5),
              child: Column(
                children: [
                  TextField(
                    controller: voltageController,
                    keyboardType: const TextInputType.numberWithOptions(),
                    decoration: InputDecoration(
                        hintText: 'Voltage (V)',
                        hintStyle:
                            const TextStyle(color: Colors.grey, fontSize: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(80),
                        )),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: currentController,
                    keyboardType: const TextInputType.numberWithOptions(),
                    decoration: InputDecoration(
                        hintText: 'Current (I)',
                        hintStyle:
                            const TextStyle(color: Colors.grey, fontSize: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(80),
                        )),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                    child: ElevatedButton(
                      onPressed: onPressed,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber[800],
                          padding: const EdgeInsets.all(5),
                          fixedSize: const Size(300, 50),
                          elevation: 15,
                          shadowColor: Colors.black,
                          side: const BorderSide(style: BorderStyle.solid)),
                      child: const Text(
                        'Calculate',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Text('Resistance (R) \n= $resistance ohm (Ω)',
                      style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'Poppins',
                        fontSize: 20,
                      ))
                ],
              ),
            )
          ],
        )),
      ),
    );
  }

  void onPressed() {
    setState(() {
      double voltage = double.parse(voltageController.text);
      double current = double.parse(currentController.text);
      double count = (voltage / current);
      String answer = count.toStringAsFixed(2);
      resistance = double.parse(answer);
      player.play(AssetSource('sounds/dingdong.mp3'));
    });
  }
}
