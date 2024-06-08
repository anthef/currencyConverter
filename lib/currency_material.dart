import 'package:flutter/material.dart';
import 'package:test_instalasi_flutter/currency_service.dart'; 

class CurrencyMaterial extends StatefulWidget {
  const CurrencyMaterial({super.key});

  @override
  State<CurrencyMaterial> createState() => _CurrencyMaterialState();
}

class _CurrencyMaterialState extends State<CurrencyMaterial> {
  double result = 0;
  final TextEditingController textEditingController = TextEditingController();
  final CurrencyService currencyService = CurrencyService();
  final List<String> currencies = ['USD', 'EUR', 'JPY', 'IDR', 'SGD']; // Add more as needed
  String fromCurrency = 'USD';
  String toCurrency = 'IDR';
  Map<String, dynamic> rates = {};

  final border = OutlineInputBorder(
    borderSide: const BorderSide(
      color: Colors.white,
      width: 2.0,
    ),
    borderRadius: BorderRadius.circular(5),
  );

  @override
  void initState() {
    super.initState();
    fetchRates();
  }

  Future<void> fetchRates() async {
    try {
      final data = await currencyService.fetchRates(fromCurrency);
      setState(() {
        rates = data['conversion_rates'];
      });
    } catch (e) {
      print('Failed to fetch exchange rates: $e');
    }
  }

  void convert() {
    setState(() {
      final amount = double.tryParse(textEditingController.text);
      if (amount != null && rates.isNotEmpty) {
        result = amount * (rates[toCurrency] ?? 0);
      } else {
        result = 0;
      }
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
                result.toStringAsFixed(2),
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
                    hintText: "Enter amount",
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
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DropdownButton<String>(
                      value: fromCurrency,
                      dropdownColor: Colors.blueGrey,
                      style: const TextStyle(color: Colors.white),
                      items: currencies.map<DropdownMenuItem<String>>(
                        (String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        },
                      ).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          fromCurrency = newValue!;
                          fetchRates();
                        });
                      },
                    ),
                    const SizedBox(width: 20),
                    DropdownButton<String>(
                      value: toCurrency,
                      dropdownColor: Colors.blueGrey,
                      style: const TextStyle(color: Colors.white),
                      items: currencies.map<DropdownMenuItem<String>>(
                        (String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        },
                      ).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          toCurrency = newValue!;
                          convert();
                        });
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: TextButton(
                  onPressed: convert,
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 50),
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
