import 'package:category_app2/features/login/presentaion/pages/login_page.dart';
import 'package:category_app2/features/login/presentaion/widgets/login_button.dart';
import 'package:category_app2/features/login/presentaion/widgets/login_image.dart';
import 'package:category_app2/features/login/presentaion/widgets/login_link.dart';
import 'package:category_app2/features/login/presentaion/widgets/login_text_field.dart';
import 'package:category_app2/features/login/presentaion/widgets/login_title.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _obscureTextPassword = true;
  bool _obscureTextConfirmPassword = true;
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String? _nameError;
  String? _emailError;
  String? _phoneError;
  String? _passwordError;
  String? _confirmPasswordError;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_validateEmail);
    _passwordController.addListener(_validatePassword);
    _confirmPasswordController.addListener(_validateConfirmPassword);
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureTextPassword = !_obscureTextPassword;
    });
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() {
      _obscureTextConfirmPassword = !_obscureTextConfirmPassword;
    });
  }

  void _validateName() {
    final value = _nameController.text;
    if (value.isEmpty) {
      setState(() {
        _nameError = 'Please enter your name';
      });
    } else {
      setState(() {
        _nameError = null;
      });
    }
  }

  void _validateEmail() {
    final value = _emailController.text;
    if (value.isEmpty) {
      setState(() {
        _emailError = 'Please enter your email';
      });
    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      setState(() {
        _emailError = 'Please enter a valid email address';
      });
    } else {
      setState(() {
        _emailError = null;
      });
    }
  }

  void _validatePhone() {
    final value = _phoneController.text;
    if (value.isEmpty) {
      setState(() {
        _phoneError = 'Please enter your phone number';
      });
    } else {
      setState(() {
        _phoneError = null;
      });
    }
  }

  void _validatePassword() {
    final value = _passwordController.text;
    if (value.isEmpty) {
      setState(() {
        _passwordError = 'Please enter your password';
      });
    } else {
      setState(() {
        _passwordError = null;
      });
    }
  }

  void _validateConfirmPassword() {
    final value = _confirmPasswordController.text;
    if (value.isEmpty) {
      setState(() {
        _confirmPasswordError = 'Please confirm your password';
      });
    } else if (value != _passwordController.text) {
      setState(() {
        _confirmPasswordError = 'Passwords do not match';
      });
    } else {
      setState(() {
        _confirmPasswordError = null;
      });
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEFEBDA),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LoginImage(topPadding: 0),
                LoginTitle(title: 'REGISTER'),

                const SizedBox(height: 5),

                // Name field
                LoginTextField(
                  controller: _nameController,
                  labelText: 'Name',
                  prefixIcon: Icons.person,
                  errorText: _nameError,
                  onSuffixIconPressed: () {},
                ),
                const SizedBox(height: 20),

                // Email field
                LoginTextField(
                  controller: _emailController,
                  labelText: 'Email',
                  prefixIcon: Icons.email,
                  errorText: _emailError,
                  onSuffixIconPressed: () {},
                ),
                const SizedBox(height: 20),

                // Phone field
                LoginTextField(
                  controller: _phoneController,
                  labelText: 'Phone',
                  prefixIcon: Icons.phone,
                  errorText: _phoneError,
                  onSuffixIconPressed: () {},
                ),
                const SizedBox(height: 20),

                // Password field
                LoginTextField(
                  controller: _passwordController,
                  labelText: 'Password',
                  prefixIcon: Icons.lock,
                  obscureText: _obscureTextPassword,
                  errorText: _passwordError,
                  suffixIcon: _obscureTextPassword
                      ? Icons.visibility
                      : Icons.visibility_off,
                  onSuffixIconPressed: _togglePasswordVisibility,
                ),
                const SizedBox(height: 20),

                // Confirm Password field
                LoginTextField(
                  controller: _confirmPasswordController,
                  labelText: 'Confirm Password',
                  prefixIcon: Icons.lock,
                  obscureText: _obscureTextConfirmPassword,
                  errorText: _confirmPasswordError,
                  suffixIcon: _obscureTextConfirmPassword
                      ? Icons.visibility
                      : Icons.visibility_off,
                  onSuffixIconPressed: _toggleConfirmPasswordVisibility,
                ),
                const SizedBox(height: 20),

                // Register button
                LoginButton(
                  text: 'Register',
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      // Handle registration logic
                    }
                  },
                ),
                const SizedBox(height: 20),

                // Login link
                LoginLink(
                  text: 'Already have an account? Login',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
