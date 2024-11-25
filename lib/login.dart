import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'signup.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginPage({super.key});

  // Fungsi Validasi Input
  bool _validateInput(BuildContext context) {
    if (_emailController.text.trim().isEmpty ||
        !_emailController.text.trim().contains('@')) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid email address.')),
      );
      return false;
    }

    if (_passwordController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a password.')),
      );
      return false;
    }
    return true;
  }

  Future<void> _login(BuildContext context) async {
    if (!_validateInput(context)) return; // Cek validasi input sebelum login

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      // Debugging: Log UserCredential
      if (kDebugMode) {
        print("User Logged In: ${userCredential.user}");
      }

      // Login berhasil
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login successful!')),
      );

      // Navigasi ke halaman utama (ganti dengan halaman utama aplikasi Anda)
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } catch (e) {
      // Menangani berbagai error dari Firebase
      if (kDebugMode) {
        print("Login Error: $e");
      }
      String errorMessage = "An error occurred. Please try again.";
      if (e is FirebaseAuthException) {
        if (e.code == 'user-not-found') {
          errorMessage = "No user found for that email.";
        } else if (e.code == 'wrong-password') {
          errorMessage = "Incorrect password.";
        }
      }
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log In'),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xFFFef3f1),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/images/WelcomePage.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: () => _login(context),
                  child: const Text('Log In'),
                ),
                const SizedBox(height: 24.0),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpPage()),
                    );
                  },
                  child: const Text(
                    "Don't have an account? Sign Up",
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: const Center(
        child: Text('Welcome to the app!'),
      ),
    );
  }
}
