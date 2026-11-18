import 'package:flutter/material.dart';
import 'package:flutter_news_application/Providers/Auth_Provider.dart';
import 'package:flutter_news_application/Views/Home_Screen.dart';
import 'package:flutter_news_application/Widgets/CustomTextFormField.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  Login({super.key});

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AuthProvider logInProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome Back',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              Text(
                'Enter your credentials to log in',
                style: TextStyle(fontSize: 16),
              ),

              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      SizedBox(height: 30),

                      CustomTextFormField(
                        title: "Email",
                        obscure: false,
                        icon: Icons.email,
                        controller: emailController,
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
                        title: "Password",
                        obscure: !logInProvider.isPasswordVisible,
                        icon: Icons.lock,
                        suffixIcon: logInProvider.isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        onSuffixPressed: () => logInProvider.togglePassword(),
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
                            await logInProvider.LoginData(
                              Email: emailController.text,
                              Password: passwordController.text,
                            );

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  logInProvider.logInModel?.message ?? '',
                                ),
                              ),
                            );

                            if (logInProvider.logInModel?.status == true) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeScreen(),
                                ),
                              );
                            }
                          }
                        },
                        child: Text(
                          'Log In',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),

                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(color: Colors.purple, fontSize: 12),
                        ),
                      ),

                      SizedBox(height: 5),
                      Text(
                        "------------ or ------------",
                        style: TextStyle(color: Colors.purple[300]),
                      ),

                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Don not have an account? Sign Up',
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
