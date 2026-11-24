import 'package:flutter/material.dart';
import 'package:flutter_quiz_2_wheather_app/Providers/AuthProvider.dart';
import 'package:flutter_quiz_2_wheather_app/Views/HomeScreen.dart';
import 'package:flutter_quiz_2_wheather_app/Views/SignUp.dart';
import 'package:flutter_quiz_2_wheather_app/Widgets/CustomTextField.dart';
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
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
        title: Text("Login"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey[300],
                maxRadius: 65,
                child: Stack(
                  children: [
                    Center(
                      child: Icon(
                        Icons.laptop_mac_rounded,
                        color: Colors.deepPurple,
                        size: 90,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsGeometry.only(bottom: 12),
                      child: Center(
                        child: Icon(
                          Icons.lock_outline_rounded,
                          color: Colors.deepPurple,
                          size: 25,
                        ),
                      ),
                    ),
                  ],
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
                        title: "Email",
                        obscure: false,
                        icon: Icons.email_outlined,
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
                        icon: Icons.lock_outline,
                        suffixIcon: logInProvider.isPasswordVisible
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
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
                          style: TextStyle(
                            color: Colors.deepOrangeAccent,
                            fontSize: 12,
                          ),
                        ),
                      ),

                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Signup()),
                          );
                        },

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don not have an account? ',
                              style: TextStyle(color: Colors.grey[800]),
                            ),
                            Text(
                              "Sign Up",
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
    );
  }
}
