import 'package:flutter/material.dart';
import 'package:flutter_news_application/Providers/Auth_Provider.dart';
import 'package:flutter_news_application/Views/LogIn.dart';
import 'package:flutter_news_application/Widgets/CustomTextFormField.dart';
import 'package:provider/provider.dart';

class Signup extends StatelessWidget {
  Signup({super.key});

  TextEditingController passwordController = TextEditingController();
  TextEditingController NameController = TextEditingController();
  TextEditingController EmailController = TextEditingController();
  TextEditingController PhoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Text(
                'Sign Up',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              Text('Create your account', style: TextStyle(fontSize: 16)),

              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      SizedBox(height: 30),

                      CustomTextFormField(
                        controller: NameController,
                        title: "Username",
                        obscure: false,
                        icon: Icons.person,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your username';
                          }
                          return null;
                        },
                        onSuffixPressed: () {},
                      ),

                      SizedBox(height: 15),

                      CustomTextFormField(
                        controller: EmailController,
                        title: "Email",
                        obscure: false,
                        icon: Icons.email,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          } else if (value.contains('@') == false) {
                            return 'Email must contain @';
                          }
                          return null;
                        },
                        onSuffixPressed: () {},
                      ),

                      SizedBox(height: 15),

                      CustomTextFormField(
                        controller: PhoneController,
                        title: "Phone",
                        obscure: false,
                        icon: Icons.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your phone';
                          }
                          return null;
                        },
                        onSuffixPressed: () {},
                      ),

                      SizedBox(height: 15),

                      CustomTextFormField(
                        title: "Password",
                        obscure: !authProvider.isPasswordVisible,
                        icon: Icons.lock,
                        suffixIcon: authProvider.isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        onSuffixPressed: () => authProvider.togglePassword(),
                        controller: passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (value.length < 6) {
                            return 'Password must be greeater than 6 characters';
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 15),

                      CustomTextFormField(
                        title: "Confirm Password",
                        obscure: !authProvider.isConfirmVisible,
                        icon: Icons.lock,
                        suffixIcon: authProvider.isConfirmVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        onSuffixPressed: () => authProvider.toggleConfirm(),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm your password';
                          }
                          if (value != passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 25),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 5,
                          backgroundColor: Colors.purple,
                          padding: EdgeInsets.symmetric(
                            horizontal: 100,
                            vertical: 15,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            await authProvider.RegisterData(
                              Name: NameController.text,
                              Email: EmailController.text,
                              Phone: PhoneController.text,
                              Password: passwordController.text,
                            );

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  authProvider.signUpModel?.message ?? '',
                                ),
                              ),
                            );

                            if (authProvider.signUpModel?.status == true) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Login(),
                                ),
                              );
                            }
                          }
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),

                      SizedBox(height: 5),
                      Text(
                        "------------ or ------------",
                        style: TextStyle(color: Colors.purple[300]),
                      ),

                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
                          );
                        },
                        child: Text(
                          'Already have an account? Log In',
                          style: TextStyle(color: Colors.purple),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
