import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CCMPage extends StatefulWidget {
  const CCMPage({super.key});

  @override
  State<CCMPage> createState() => _CCMPageState();
}

class _CCMPageState extends State<CCMPage> {
  double result = 0;
  final TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final border =  OutlineInputBorder(
      borderSide: const BorderSide(
        color: Color.fromRGBO(51, 0, 255, 1),
        width: 2.0,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(10)),
    );

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        systemOverlayStyle:const SystemUiOverlayStyle(
          statusBarColor: Colors.blueGrey,
          statusBarBrightness: Brightness.light,
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 60, 0, 255),
        title: const Text('Currency Converter',style: TextStyle(color: Colors.white),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: const Icon(
                Icons.currency_rupee_outlined,
                size: 80,
                weight: 500,
                color: Color.fromARGB(255, 61, 41, 240),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(20.0),
              child: Text(
                '${result!=0?result.toStringAsFixed(2):result.toStringAsFixed(0)}',
                style: const TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: textEditingController,
                decoration: InputDecoration(
                  hintText: 'Enter Amount in USD',
                  hintStyle: const TextStyle(
                    color: Colors.black,
                  ),
                  prefixIcon: const Icon(Icons.monetization_on_outlined),
                  prefixIconColor: const Color.fromRGBO(51, 0, 255, 1),
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: border,
                  enabledBorder: border,
                ),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    result = double.parse(textEditingController.text) * 83.32;
                  });
                },
                style: TextButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(51, 0, 255, 1),
                  minimumSize: const Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text(
                  'Convert',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 60,),
            Container(
              child: Text("Made by Harsh Kumar Gupta"),
            )
          ],
        ),
      ),
    );
  }
}
