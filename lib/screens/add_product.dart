import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/snackbar.dart';
import '../services/product.dart';

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

      Get.back();
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
      appBar: AppBar(),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
            child: const Text(
              'Add Product',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ),
          addForm()
        ],
      ),
    );
  }

  Widget addForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          textField(nameController, 'Name', 'text'),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
            child: DropdownButtonFormField(
              key: _keyCategory,
              elevation: 16,
              onChanged: (newValue) {
                setState(() {
                  category = newValue!;
                });
              },
              decoration: InputDecoration(
                hintText: 'Categories',
                contentPadding: const EdgeInsets.all(12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                hintStyle: Theme.of(context).textTheme.labelMedium,
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
          ),
          textField(priceController, 'Price', 'number'),
          textField(quantityController, 'Quantity', 'number'),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
            child: DropdownButtonFormField(
              key: _keyUom,
              elevation: 16,
              onChanged: (newValue) {
                setState(() {
                  uom = newValue!;
                });
              },
              decoration: InputDecoration(
                hintText: 'Unit of measurement',
                contentPadding: const EdgeInsets.all(12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                hintStyle: Theme.of(context).textTheme.labelMedium,
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
          ),
          textField(anualHarvestController, 'Anual Harvest', 'number'),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                enableFeedback: false,
                primary: Theme.of(context).colorScheme.secondary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onPressed: handleSubmit,
              child: const Text(
                'Save',
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
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: const EdgeInsets.all(16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
        style: Theme.of(context).textTheme.labelMedium,
        keyboardType:
            type == 'number' ? TextInputType.number : TextInputType.text,
      ),
    );
  }
}
