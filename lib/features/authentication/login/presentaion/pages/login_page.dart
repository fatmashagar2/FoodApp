import 'package:category_app2/core/utils/app_colors.dart';
import 'package:category_app2/features/authentication/auth_cubit/auth_cubit.dart';
import 'package:category_app2/features/authentication/auth_cubit/auth_states.dart';
import 'package:category_app2/features/authentication/common_widgets/widgets/button.dart';
import 'package:category_app2/features/authentication/common_widgets/widgets/image.dart';
import 'package:category_app2/features/authentication/common_widgets/widgets/link.dart';
import 'package:category_app2/features/authentication/common_widgets/widgets/text_field.dart';
import 'package:category_app2/features/authentication/common_widgets/widgets/title.dart';
import 'package:category_app2/features/authentication/register/presentaion/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? _emailError;
  String? _passwordError;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_validateEmail);
    _passwordController.addListener(_validatePassword);
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
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

  void _validatePassword() {
    final value = _passwordController.text;
    if (value.isEmpty) {
      setState(() {
        _passwordError = 'Please enter your password';
      });
    } else if (value.length < 6) {
      setState(() {
        _passwordError = 'Password must greater than 6 char';
      });
    } else {
      setState(() {
        _passwordError = null;
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.main,
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                    key: _formKey,
                    child: BlocConsumer<AuthCubit, AuthStates>(
                        builder: (context, state) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ImageUp(
                            topPadding: 50,
                          ),
                          const SizedBox(height: 10),
                          TitleAll(
                            title: 'LOGIN',
                          ),
                          const SizedBox(height: 20),
                          TextFieldAll(
                            keyboardType: TextInputType.emailAddress,
                            controller: _emailController,
                            labelText: 'Email',
                            prefixIcon: Icons.email,
                            errorText: _emailError,
                          ),
                          const SizedBox(height: 20),
                          TextFieldAll(
                            controller: _passwordController,
                            labelText: 'Password',
                            prefixIcon: Icons.lock,
                            obscureText: _obscureText,
                            suffixIcon: _obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                            onSuffixIconPressed: _togglePasswordVisibility,
                            errorText: _passwordError,
                          ),
                          const SizedBox(height: 20),
                          Button(
                            onPressed: BlocProvider.of<AuthCubit>(context).state
                                    is LoginLoadingState
                                ? null // Disable the button when loading
                                : () {
                                    if (_formKey.currentState!.validate()) {
                                      BlocProvider.of<AuthCubit>(context).login(
                                        email: _emailController.text,
                                        password: _passwordController.text,
                                      );
                                    }
                                  },
                            child: BlocProvider.of<AuthCubit>(context).state
                                    is LoginLoadingState
                                ? Center(
                                    child: SpinKitFadingCircle(
                                        color: AppColors.main, size: 50.0))
                                : Text(
                                    'Login',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                          ),
                          const SizedBox(height: 20),
                          Link(
                            text: 'Don\'t have an account? Register',
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterPage()),
                              );
                            },
                          ),
                        ],
                      );
                    }, listener: (context, state) {
                      if (state is LoginSuccessState) {
                        Navigator.pushReplacementNamed(context, "/categories");
                      } else if (state is LoginFailedState) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Login Failed',
                                  style: TextStyle(color: Colors.red)),
                              content: Text(state.message,
                                  style: TextStyle(color: Colors.black)),
                              backgroundColor: Colors.white,
                              actions: [
                                TextButton(
                                  child: Text('OK',
                                      style: TextStyle(color: Colors.red)),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    })))));
  }
}
