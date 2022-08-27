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

  final TextEditingController nameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  bool isLoading = false;

  Future<void> handleSubmit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      print(village);

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
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
            ],
          ),
        ],
      ),
    );
  }

  Widget registerForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          textField(nameController, 'Name'),
          textField(usernameController, 'Username'),
          textField(emailController, 'Email'),
          textField(passwordController, 'Password'),
          textField(addressController, 'Address'),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
            child: DropdownButtonFormField(
              key: _key,
              onChanged: (newValue) {
                setState(() {
                  role = newValue!;
                });
              },
              decoration: InputDecoration(
                hintText: 'Role',
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
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
            child: DropdownButtonFormField(
              key: _keyProvince,
              onChanged: (String? newValue) {
                setState(() {
                  province = newValue!;
                  getRegencies(int.parse(newValue));
                });
              },
              disabledHint: Text(
                'Provinces',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              decoration: InputDecoration(
                hintText: 'Provinces',
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
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
            child: DropdownButtonFormField(
              key: _keyRegency,
              onChanged: (String? newValue) {
                setState(() {
                  regency = newValue!;
                  getDistrict(int.parse(newValue));
                });
              },
              disabledHint: Text(
                'Regencies',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              decoration: InputDecoration(
                hintText: 'Regencies',
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
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
            child: DropdownButtonFormField(
              key: _keyDistrict,
              onChanged: (String? newValue) {
                setState(() {
                  district = newValue!;
                  getVillage(int.parse(newValue));
                });
              },
              disabledHint: Text(
                'Districts',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              decoration: InputDecoration(
                hintText: 'Districts',
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
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
            child: DropdownButtonFormField(
              key: _keyVillage,
              elevation: 16,
              onChanged: (String? newValue) {
                setState(() {
                  village = newValue!;
                });
              },
              disabledHint: Text(
                'Villages',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              decoration: InputDecoration(
                hintText: 'Villages',
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
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
            alignment: Alignment.bottomRight,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                enableFeedback: false,
                minimumSize: const Size.fromHeight(40),
                primary: Theme.of(context).colorScheme.secondary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onPressed: handleSubmit,
              child: const Text(
                'Sign in',
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
      ),
    );
  }
}
