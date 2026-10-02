import 'package:flutter/material.dart';
import 'package:kuis_mobile_124240063/models/data.dart';
import 'package:kuis_mobile_124240063/root.dart';

// Widget Class
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

// State Class
class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoggedIn = false;

  void _login({required String email, required String password}) {
    if (email == account.username && password == account.password) {
      setState(() {
        _isLoggedIn = true;
      });

      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (context) => Root()),
      // );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Root(username: _emailController.text),
        ),
      );
      // Memanggil snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          content: Text("Login Berhasil!"),
        ),
      );
    } else {
      setState(() {
        _isLoggedIn = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor: Colors.red, content: Text("Login Gagal!")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              spacing: 10,
              children: [
                Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9Q8Ls4f_a0MIqSmz9Zj_GHOB7GvBslkNbESYWMzd9mw&s=10',
                  height: 350,
                ),
                Text("Selamat Datang di Toko Sepatu"),
                Text("Selamat Berbelanja"),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    // suffix: Icon(Icons.email),
                    hintText: "johndoe@email.com",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                ),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    // suffix: Icon(Icons.email),
                    hintText: "*********",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _isLoggedIn ? Colors.green : Colors.red,
                    ),
                    onPressed: () {
                      _login(
                        email: _emailController.text,
                        password: _passwordController.text,
                      );
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 250, 250, 250),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // body: Center(
      //   child: Text('$name Kamu klik button sebanyak ${_counter}'),
      // ),

      // floatingActionButton: FloatingActionButton(
      //   onPressed: (){
      //     setState(() {
      //       _counter++;
      //       name = "Zakinanda";

      //       if(_counter % 2 == 0){
      //         name = "Alfin";
      //       }
      //     });
      //   },
      //   child: Icon(Icons.add),
      // ),
    );
  }
}
