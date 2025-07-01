import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_navigator/providers/auth_provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _userCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  bool _loading = false;
  String? _error;

  void _tryLogin() async {
    setState(() {
      _loading = true;
      _error = null;
    });

    final auth = Provider.of<AuthProvider>(context, listen: false);
    bool success = await auth.login(_userCtrl.text.trim(), _passCtrl.text);

    if (success) {
      Navigator.pushReplacementNamed(context, "/");
    } else {
      setState(() {
        _error = "Nom d'utilisateur ou mot de passe incorrect";
        _loading = false;
        _passCtrl.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Connexion"),
        backgroundColor: Colors.lightBlueAccent,
        elevation: 0,

      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.grey.shade200],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 32),
        child: Center(
          child: SingleChildScrollView(
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Bienvenue",
                      style: theme.textTheme.headlineLarge!.copyWith(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: _userCtrl,
                      decoration: InputDecoration(
                        labelText: "Nom d'utilisateur",
                        prefixIcon: Icon(Icons.person, color: Colors.lightBlueAccent),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 16),
                    TextField(
                      controller: _passCtrl,
                      decoration: InputDecoration(
                        labelText: "Mot de passe",
                        prefixIcon: Icon(Icons.lock, color: Colors.lightBlueAccent),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: 20),
                    if (_error != null)
                      Text(
                        _error!,
                        style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.w600),
                      ),
                    SizedBox(height: 20),
                    _loading
                        ? CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.lightBlueAccent),
                    )
                        : SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightBlueAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white),
                        ),
                        onPressed: _tryLogin,

                        child: Text("Se connecter"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
