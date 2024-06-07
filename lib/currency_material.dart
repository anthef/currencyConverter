import 'package:flutter/material.dart';

class CurrencyMaterial extends StatelessWidget {
  const CurrencyMaterial({super.key});

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.white,
        width: 2.0,
      ),
      borderRadius: BorderRadius.circular(5),
    );
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: ColoredBox(
          color: Color.fromRGBO(20, 2, 5, 0.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '0',
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 255, 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  textCapitalization: TextCapitalization.characters,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Please text something",
                    hintStyle: TextStyle(color: Colors.white),
                    prefixIcon: const Icon(
                      Icons.monetization_on_outlined,
                      color: Colors.white,
                    ),
                    filled: true,
                    fillColor: Colors.blueGrey,
                    focusedBorder: border,
                    enabledBorder: border,
                  ),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                ),
              ),
              TextButton(
                  onPressed: () {
                    print('button clicked');
                  },
                  child: const Text("Click me!")),
            ],
          ),
        ),
      ),
    );
  }
}
