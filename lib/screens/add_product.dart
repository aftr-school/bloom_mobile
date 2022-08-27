import 'package:bloom_mobile/services/product.dart';
import 'package:flutter/material.dart';

import '../components/snackbar.dart';
import '../services/address.dart';
import '../services/auth.dart';
import '../services/role.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProduct();
}

class _AddProduct extends State<AddProduct> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController uomController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController anualHarvestController = TextEditingController();

  bool isLoading = false;

  Future<void> handleSubmit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      ProductService().post(Product(
        name: nameController.text,
        price: int.parse(priceController.text),
        anualHarvest: int.parse(anualHarvestController.text),
        productCategoryId: category,
        qunatity: int.parse(quantityController.text),
        uom: uom,
      ));
    }
  }

  final _keyCategory = GlobalKey<FormFieldState>();
  List listCategory = [];
  var category;

  getCategory() async {
    try {
      final res = await ProductService().getCategory();
      setState(() {
        listCategory = res;
      });
    } catch (e) {
      snackbarError(toString());
    }
  }

  final _keyUom = GlobalKey<FormFieldState>();
  var uom;

  @override
  void initState() {
    super.initState();
    getCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 50, left: 20, right: 20),
          child: Column(children: [
            Container(
              padding: const EdgeInsets.all((25)),
              child: Column(children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 5),
                  child: const Text(
                    "Tambah Product",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 25),
                  child: const Text(
                    "isi form dibawah",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ),
                registerForm()
              ]),
            ),
          ]),
        ),
      ),
    );
  }

  Widget registerForm() {
    return Form(
      key: _formKey,
      child: Wrap(
        runSpacing: 20,
        children: <Widget>[
          textField(nameController, 'Name', 'text'),
          DropdownButtonFormField(
            key: _keyCategory,
            elevation: 16,
            onChanged: (newValue) {
              setState(() {
                category = newValue!;
              });
            },
            hint: const Text('Plih Product Category'),
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              labelStyle: Theme.of(context).textTheme.labelMedium,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).primaryColor),
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
            ),
            items: listCategory.map((value) {
              return DropdownMenuItem(
                value: value['id'],
                child: Text(
                  value['name'],
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              );
            }).toList(),
          ),
          textField(priceController, 'Price', 'number'),
          textField(quantityController, 'Quantity', 'number'),
          DropdownButtonFormField(
            key: _keyUom,
            elevation: 16,
            onChanged: (newValue) {
              setState(() {
                uom = newValue!;
              });
            },
            hint: const Text('Plih Uom'),
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              labelStyle: Theme.of(context).textTheme.labelMedium,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).primaryColor),
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
            ),
            items: ['kg', 'liter', 'unit'].map((value) {
              return DropdownMenuItem(
                value: value,
                child: Text(
                  value,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              );
            }).toList(),
          ),
          textField(anualHarvestController, 'Anual Harvest', 'number'),
          Container(
            margin: const EdgeInsets.only(top: 10),
            alignment: Alignment.bottomRight,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(40),
                primary: Theme.of(context).colorScheme.secondary,
              ),
              onPressed: handleSubmit,
              child: const Text(
                "Save",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget textField(controller, hintText, type) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.only(left: 10),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary),
        ),
        hintText: hintText,
      ),
      style: Theme.of(context).textTheme.labelMedium,
      keyboardType: type == 'number' ? TextInputType.number : TextInputType.text,
    );
  }
}
