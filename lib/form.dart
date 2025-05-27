import 'package:flutter/material.dart';
import 'package:myapp/details.dart';

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _id_producto = TextEditingController();
  final _nombre_prod = TextEditingController();
  final _tipo_prod = TextEditingController();
  final _cant_prod = TextEditingController();
  final _precio_prod = TextEditingController();
  final _id_proveedor = TextEditingController();
  final _color_prod = TextEditingController();

  @override
  void dispose() {
    _id_producto.dispose();
    _nombre_prod.dispose();
    _tipo_prod.dispose();
    _cant_prod.dispose();
    _precio_prod.dispose();
    _id_proveedor.dispose();
    _color_prod.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: const Color.fromRGBO(255, 221, 253, 1),
            title: const Text("Music Portal"),
            centerTitle: true),
        body: Container(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              const SizedBox(height: 10.0),
              MyTextField(
                  myController: _id_producto,
                  fieldName: "ID del Producto",
                  myIcon: Icons.key,
                  prefixIconColor: const Color.fromARGB(255, 241, 0, 169)),
              const SizedBox(height: 20.0),
              //Use to add space between Textfields
              MyTextField(
                  myController: _nombre_prod,
                  fieldName: "Nombre del Producto",
                  myIcon: Icons.sell_outlined,
                  prefixIconColor: const Color.fromARGB(255, 241, 0, 169)),
              const SizedBox(height: 20.0),
              //Use to add space between Textfields
              MyTextField(
                  myController: _tipo_prod,
                  fieldName: "Tipo de Producto",
                  myIcon: Icons.category_outlined,
                  prefixIconColor: const Color.fromARGB(255, 241, 0, 169)),
              const SizedBox(height: 20.0),
              MyTextField(
                  myController: _cant_prod,
                  fieldName: "Cantidad del Producto",
                  myIcon: Icons.pin_outlined,
                  prefixIconColor: const Color.fromARGB(255, 241, 0, 169)),
              const SizedBox(height: 20.0),
              MyTextField(
                  myController: _precio_prod,
                  fieldName: "Precio del Producto",
                  myIcon: Icons.payments_outlined,
                  prefixIconColor: const Color.fromARGB(255, 241, 0, 169)),
              const SizedBox(height: 20.0),
              MyTextField(
                  myController: _id_proveedor,
                  fieldName: "ID del Proveedor",
                  myIcon: Icons.key,
                  prefixIconColor: const Color.fromARGB(255, 241, 0, 169)),
              const SizedBox(height: 20.0),
              MyTextField(
                  myController: _color_prod,
                  fieldName: "Color del Producto",
                  myIcon: Icons.palette_outlined,
                  prefixIconColor: const Color.fromARGB(255, 241, 0, 169)),
              const SizedBox(height: 20.0),
              myBtn(context),
            ],
          ),
        ));
  }

  //Function that returns OutlinedButton Widget also it pass data to Details Screen
  OutlinedButton myBtn(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(minimumSize: const Size(200, 50)),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return Details(
              productName: _id_producto.text,
              productDescription: _nombre_prod.text,
              productType: _tipo_prod.text,
              productQuantity: _cant_prod.text,
              productPrice: _precio_prod.text,
              productSupplier: _id_proveedor.text,
              productColor: _color_prod.text,
            );
          }),
        );
      },
      child: Text(
        "Submit Form".toUpperCase(),
        style: const TextStyle(
            fontWeight: FontWeight.bold, color: Colors.deepPurple),
      ),
    );
  }
}

//Custom STateless WIdget Class that helps re-usability
// You can learn it in Tutorial (2.13) Custom Widget in Flutter
class MyTextField extends StatelessWidget {
  MyTextField({
    Key? key,
    required this.fieldName,
    required this.myController,
    this.myIcon = Icons.verified_user_outlined,
    this.prefixIconColor = Colors.blueAccent,
  });

  final TextEditingController myController;
  String fieldName;
  final IconData myIcon;
  Color prefixIconColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: myController,
      decoration: InputDecoration(
          labelText: fieldName,
          prefixIcon: Icon(myIcon, color: prefixIconColor),
          border: const OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurple.shade300),
          ),
          labelStyle: const TextStyle(color: Colors.deepPurple)),
    );
  }
}
