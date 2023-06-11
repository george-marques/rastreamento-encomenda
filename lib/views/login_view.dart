import 'package:flutter/material.dart';
import 'package:rastrear_encomenda/routes/app_routes.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();

  static void logout(BuildContext context) {
    _clearTextFields();
    Navigator.pushReplacementNamed(context, AppRoutes.LOGIN);
  }

  static TextEditingController _usernameController = TextEditingController();
  static TextEditingController _passwordController = TextEditingController();

  static void _clearTextFields() {
    _usernameController.clear();
    _passwordController.clear();
  }
}

class _LoginScreenState extends State<LoginView> {
  String _errorMessage = '';
  bool _passwordVisible = false;

  void _login(BuildContext context) {
    String username = LoginView._usernameController.text;
    String password = LoginView._passwordController.text;

    if (username == 'admin' && password == '123456') {
      Navigator.pushReplacementNamed(context, AppRoutes.HOME);
    } else {
      setState(() {
        _errorMessage = 'Usuário ou senha inválidos';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Icon(
                Icons.account_circle,
                size: 96.0,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 24.0),
            TextFormField(
              controller: LoginView._usernameController,
              decoration: InputDecoration(
                labelText: 'Usuário',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            SizedBox(height: 12.0),
            TextFormField(
              controller: LoginView._passwordController,
              obscureText: !_passwordVisible,
              decoration: InputDecoration(
                labelText: 'Senha',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                prefixIcon: Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(
                    _passwordVisible ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Center(
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => _login(context),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.amber,
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 12.0),
            TextButton(
              onPressed: () {},
              child: Text('Não tem cadastro? Cadastre-se'),
            ),
            SizedBox(height: 12.0),
            Text(
              _errorMessage,
              style: TextStyle(
                color: Colors.red,
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
