import 'package:flutter/material.dart';

class FormData {
  String name;

  String password;

  FormData({required this.name, required this.password});
}

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();

  final _formData = FormData(password: '', name: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          scrollDirection: Axis.vertical,
          children: [
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
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              FormDetailsPage(formData: _formData)),
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

class FormDetailsPage extends StatelessWidget {
  final FormData formData;

  FormDetailsPage({required this.formData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Produtos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Informações recebidas:'),
            const SizedBox(height: 16),
            Text('Nome: ${formData.name}'),
            const SizedBox(height: 16),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        height: 40.0,
        width: MediaQuery.of(context).size.width * 0.90,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyApp()),
            );
          },
          shape: const RoundedRectangleBorder(),
          backgroundColor: Colors.blue,
          child: const Text('VOLTAR', textAlign: TextAlign.center),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navegação entre páginas',
      home: FormPage(),
    );
  }
}
