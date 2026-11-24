import 'package:flutter/material.dart';
import 'package:flutter_quiz_2_wheather_app/Providers/AuthProvider.dart';
import 'package:flutter_quiz_2_wheather_app/Views/Login.dart';
import 'package:flutter_quiz_2_wheather_app/Widgets/CustomTextField.dart';
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
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
        title: Text("Sign Up"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),

                CircleAvatar(
                  backgroundColor: Colors.grey[300],
                  maxRadius: 55,
                  child: Icon(
                    Icons.person_add_alt_1_outlined,
                    color: Colors.deepPurple,
                    size: 80,
                  ),
                ),

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
                          icon: Icons.person_outline,
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
                          icon: Icons.email_outlined,
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
                          icon: Icons.phone_outlined,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Phone number';
                            }
                            return null;
                          },
                          onSuffixPressed: () {},
                        ),

                        SizedBox(height: 15),

                        CustomTextFormField(
                          title: "Password",
                          obscure: !authProvider.isPasswordVisible,
                          icon: Icons.lock_outline,
                          suffixIcon: authProvider.isPasswordVisible
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
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
                          icon: Icons.lock_outline,
                          suffixIcon: authProvider.isConfirmVisible
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
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
                            backgroundColor: Colors.deepOrange,
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
                                Password: passwordController.text,
                                Phone: PhoneController.text,
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

                        SizedBox(height: 10),

                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Login()),
                            );
                          },

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Already have an account? ',
                                style: TextStyle(color: Colors.grey[800]),
                              ),
                              Text(
                                "Login",
                                style: TextStyle(color: Colors.deepOrange),
                              ),
                            ],
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
      ),
    );
  }
}
