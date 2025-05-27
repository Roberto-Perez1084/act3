import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  Details({
    Key? key,
    required this.productName,
    required this.productDescription,
    required this.productType,
    required this.productQuantity,
    required this.productPrice,
    required this.productSupplier,
    required this.productColor,
  }) : super(key: key);

  final String productName;
  final String productDescription;
  final String productType;
  final String productQuantity;
  final String productPrice;
  final String productSupplier;
  final String productColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 221, 253, 1),
        title: const Text("Music Portal"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min, // Aquí está el ajuste dinámico
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildRow("Product Name", productName),
                _buildRow("Description", productDescription),
                _buildRow("Type", productType),
                _buildRow("Quantity", productQuantity),
                _buildRow("Price", productPrice),
                _buildRow("Supplier", productSupplier),
                _buildRow("Color", productColor),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: RichText(
        text: TextSpan(
          text: "$label: ",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.black,
          ),
          children: [
            TextSpan(
              text: value,
              style: const TextStyle(
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
