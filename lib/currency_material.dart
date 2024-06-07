import 'package:flutter/material.dart';

class CurrencyMaterial extends StatefulWidget {
  const CurrencyMaterial({super.key});

  @override
  State<CurrencyMaterial> createState() => _CurrencyMaterialState();
}

class _CurrencyMaterialState extends State<CurrencyMaterial> {
  double result = 0;
  final TextEditingController textEditingController = TextEditingController();

  final border = OutlineInputBorder(
    borderSide: const BorderSide(
      color: Colors.white,
      width: 2.0,
    ),
    borderRadius: BorderRadius.circular(5),
  );

  void convert() {
    setState(() {
      result = double.tryParse(textEditingController.text) != null
          ? double.parse(textEditingController.text) * 16280.80
          : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blueGrey,
        title: const Text(
          "Currency Converter",
          style: TextStyle(color: Colors.white, fontFamily: 'Times New Roman'),
        ),
      ),
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: ColoredBox(
          color: Colors.blueGrey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                result.toString(),
                style: const TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: textEditingController,
                  textCapitalization: TextCapitalization.characters,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Please text something",
                    hintStyle: const TextStyle(
                        color: Colors.white, fontFamily: 'Times New Roman'),
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
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: TextButton(
                  onPressed: () {
                    convert();
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 50),
                    shape: const CircleBorder(),
                  ),
                  child: const Icon(Icons.money_rounded),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


