import 'package:flutter/material.dart';
import 'package:flutter_library_application/Providers/Auth_Provider.dart';
import 'package:flutter_library_application/Views/LogIn_Screen.dart';
import 'package:flutter_library_application/Widgets/Custom_Text_Form_Field.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

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
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: CircleAvatar(
                    maxRadius: 100,
                    backgroundColor: Colors.transparent,
                    backgroundImage: NetworkImage(
                      "https://cdni.iconscout.com/illustration/premium/thumb/sign-up-page-illustration-svg-download-png-1598253.png",
                    ),
                  ),
                ),
                Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                Text('Create your account', style: TextStyle(fontSize: 16)),

                SizedBox(height: 10),

                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
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
                            backgroundColor: Color(0xff123B63),
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
                                    builder: (context) => LoginScreen(),
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
                          style: TextStyle(
                            color: Color.fromARGB(255, 101, 120, 139),
                          ),
                        ),

                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Already have an account? ',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 114, 114, 114),
                                ),
                              ),
                              Text(
                                "Log In",
                                style: TextStyle(color: Color(0xff123B63)),
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
