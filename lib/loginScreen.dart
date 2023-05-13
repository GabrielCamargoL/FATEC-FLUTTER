import 'package:flutter/material.dart';

import 'listProductsScreen.dart';

class FormData {
  String name;
  String password;

  FormData({required this.name, required this.password});
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

//--------------- Login ---------------
class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _formData = FormData(password: '', name: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: const Color.fromARGB(220, 70, 20, 43),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          scrollDirection: Axis.vertical,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 40),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Nome'),
              validator: (value) {
                if (value!.isEmpty) return 'Insira o nome!';

                return null;
              },
              onSaved: (value) {
                _formData.name = value!;
              },
            ),
            const SizedBox(height: 8),
            TextFormField(
              obscureText: true,
              autocorrect: false,
              enableSuggestions: false,
              decoration: const InputDecoration(labelText: 'Senha'),
              validator: (value) {
                if (value!.isEmpty) return 'Insira a senha!';

                return null;
              },
              onSaved: (value) {
                _formData.password = value!;
              },
            ),
            const SizedBox(height: 40),
            SizedBox(
              height: 40.0,
              width: MediaQuery.of(context).size.width * 0.50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(220, 70, 20, 43),
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ListProductsScreen(formData: _formData)),
                    );
                  }
                },
                child: const Text('ENTRAR', textAlign: TextAlign.center),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
