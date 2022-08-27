import 'package:flutter/material.dart';

import '../components/snackbar.dart';
import '../services/address.dart';
import '../services/auth.dart';
import '../services/role.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  bool isLoading = false;

  Future<void> handleSubmit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      await AuthService().registerService(
        Register(
          name: nameController.text,
          username: usernameController.text,
          email: emailController.text,
          password: passwordController.text,
          roleId: role,
          address: addressController.text,
          provincesId: int.parse(province),
          regenciesId: int.parse(regency),
          districtsId: int.parse(district),
          villagesId: int.parse(village),
          latitude: '-6.494451239949463',
          longitude: '106.80363584073018',
        ),
      );
    }
  }

  final _key = GlobalKey<FormFieldState>();
  List listRole = [];
  var role;

  getRole() async {
    try {
      final res = await RoleService().get();
      setState(() {
        listRole = res;
      });
    } catch (e) {
      snackbarError(toString());
    }
  }

  final _keyProvince = GlobalKey<FormFieldState>();
  List listProvince = [];
  var province;

  FocusNode provinceNode = FocusNode();

  getProvinces() async {
    try {
      final res = await AddressService().getProvinces();
      setState(() {
        listProvince = res;
      });
    } catch (e) {
      snackbarError(toString());
    }
  }

  final _keyRegency = GlobalKey<FormFieldState>();
  List listRegency = [];
  var regency;

  getRegencies(provinceId) async {
    _keyRegency.currentState!.reset();
    _keyDistrict.currentState!.reset();
    _keyVillage.currentState!.reset();

    try {
      final res = await AddressService().getRegencies(provinceId);
      setState(() {
        listRegency = res;
      });
    } catch (e) {
      snackbarError(toString());
    }
  }

  final _keyDistrict = GlobalKey<FormFieldState>();
  List listDistrict = [];
  var district;

  getDistrict(regencyId) async {
    _keyDistrict.currentState!.reset();
    _keyVillage.currentState!.reset();

    try {
      final res = await AddressService().getDistricts(regencyId);
      setState(() {
        listDistrict = res;
      });
    } catch (e) {
      snackbarError(toString());
    }
  }

  final _keyVillage = GlobalKey<FormFieldState>();
  List listVillage = [];
  var village;

  getVillage(regencyId) async {
    _keyVillage.currentState!.reset();

    try {
      final res = await AddressService().getVillages(regencyId);
      setState(() {
        listVillage = res;
      });
    } catch (e) {
      snackbarError(toString());
    }
  }

  @override
  void initState() {
    super.initState();
    getRole();
    getProvinces();
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
                    "Sign up",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 25),
                  child: const Text(
                    "Please Sign up to continue",
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
          textField(nameController, 'Name'),
          textField(usernameController, 'Username'),
          textField(emailController, 'Email'),
          textField(passwordController, 'Password'),
          textField(addressController, 'Address'),
          DropdownButtonFormField(
            key: _key,
            elevation: 16,
            onChanged: (newValue) {
              setState(() {
                role = newValue!;
              });
            },
            hint: const Text('Plih Role'),
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
            items: listRole.map((value) {
              return DropdownMenuItem(
                value: value['id'],
                child: Text(
                  value['name'],
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              );
            }).toList(),
          ),
          DropdownButtonFormField(
            key: _keyProvince,
            elevation: 16,
            onChanged: (String? newValue) {
              setState(() {
                province = newValue!;
              });
              getRegencies(int.parse(newValue!));
            },
            hint: const Text("Pilih Provinsi"),
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
            items: listProvince.map((value) {
              return DropdownMenuItem<String>(
                value: value['id'],
                child: Text(
                  value['name'],
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              );
            }).toList(),
          ),
          DropdownButtonFormField(
            key: _keyRegency,
            elevation: 16,
            onChanged: (String? newValue) {
              setState(() {
                regency = newValue!;
              });
              getDistrict(int.parse(newValue!));
            },
            hint: const Text("Pilih Kota"),
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
            items: listRegency.map((value) {
              return DropdownMenuItem<String>(
                value: value['id'],
                child: Text(
                  value['name'],
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              );
            }).toList(),
          ),
          DropdownButtonFormField(
            key: _keyDistrict,
            elevation: 16,
            onChanged: (String? newValue) {
              setState(() {
                district = newValue!;
              });
              getVillage(int.parse(newValue!));
            },
            hint: const Text("Pilih Kecamatan"),
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
            items: listDistrict.map((value) {
              return DropdownMenuItem<String>(
                value: value['id'],
                child: Text(
                  value['name'],
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              );
            }).toList(),
          ),
          DropdownButtonFormField(
            key: _keyVillage,
            elevation: 16,
            onChanged: (String? newValue) {
              setState(() {
                village = newValue!;
              });
            },
            hint: const Text("Pilih Desa"),
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
            items: listVillage.map((value) {
              return DropdownMenuItem<String>(
                value: value['id'],
                child: Text(
                  value['name'],
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              );
            }).toList(),
          ),
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
                "Sign in",
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

  Widget textField(controller, hintText) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.only(left: 10),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Theme.of(context).colorScheme.secondary),
        ),
        hintText: hintText,
      ),
      style: Theme.of(context).textTheme.labelMedium,
    );
  }
}
