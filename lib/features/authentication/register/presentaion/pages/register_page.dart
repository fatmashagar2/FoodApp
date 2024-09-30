import 'package:category_app2/core/utils/app_colors.dart';
import 'package:category_app2/features/authentication/auth_cubit/auth_cubit.dart';
import 'package:category_app2/features/authentication/auth_cubit/auth_states.dart';
import 'package:category_app2/features/authentication/common_widgets/widgets/button.dart';
import 'package:category_app2/features/authentication/common_widgets/widgets/image.dart';
import 'package:category_app2/features/authentication/common_widgets/widgets/link.dart';
import 'package:category_app2/features/authentication/common_widgets/widgets/text_field.dart';
import 'package:category_app2/features/authentication/common_widgets/widgets/title.dart';
import 'package:category_app2/features/authentication/login/presentaion/pages/login_page.dart';
import 'package:category_app2/features/category/presentation/pages/category_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
    _phoneController.addListener(_validatePhone);
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
    } else if (value.length != 11) {
      setState(() {
        _phoneError = 'Please enter correct phone number';
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
    } else if (value.length < 6) {
      setState(() {
        _passwordError = 'Password must greater than 6';
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
    return BlocConsumer<AuthCubit, AuthStates>(
        builder: (context, state) {
          return Scaffold(
              backgroundColor: AppColors.main,
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ImageUp(topPadding: 0),
                      TitleAll(title: 'REGISTER'),

                      const SizedBox(height: 5),

                      // Name field
                      TextFieldAll(

                        controller: _nameController,
                        labelText: 'Name',
                        prefixIcon: Icons.person,
                        errorText: _nameError,
                        onSuffixIconPressed: () {},
                      ),
                      const SizedBox(height: 20),

                      // Email field
                      TextFieldAll(
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        labelText: 'Email',
                        prefixIcon: Icons.email,
                        errorText: _emailError,
                        onSuffixIconPressed: () {},
                      ),
                      const SizedBox(height: 20),

                      // Phone field
                      TextFieldAll(
                        keyboardType:TextInputType.phone ,
                        controller: _phoneController,
                        labelText: 'Phone',
                        prefixIcon: Icons.phone,
                        errorText: _phoneError,
                        onSuffixIconPressed: () {},
                      ),
                      const SizedBox(height: 20),

                      // Password field
                      TextFieldAll(
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
                      TextFieldAll(
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
                      Button(
                        onPressed: BlocProvider.of<AuthCubit>(context).state is RegisterLoadingState
                            ? null // Disable the button when loading
                            : () {
                          if (_formKey.currentState!.validate()) {
                            BlocProvider.of<AuthCubit>(context).register(
                              name: _nameController.text,
                              email: _emailController.text,
                              phone: _phoneController.text,
                              password: _passwordController.text,
                            );
                          }
                        },
                        child: BlocProvider.of<AuthCubit>(context).state is RegisterLoadingState
                            ?     Center(child: SpinKitFadingCircle(color:AppColors.red, size: 50.0))
                            : Text(
                          'Register',
                          style:  TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.main,
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Login link
                      Link(
                        text: 'Already have an account? Login',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          Navigator.pushReplacementNamed(context, "/categories");
        } else if (state is FailedState) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Registration Failed', style: TextStyle(color: Colors.red)),
                content: Text(state.message, style: TextStyle(color: Colors.black)),
                actions: [
                  TextButton(
                    child: Text('OK', style: TextStyle(color: Colors.red)),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        }
      },
    );

  }
}
