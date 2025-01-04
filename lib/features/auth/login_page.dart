import 'package:flutter/material.dart';
import 'package:mega_store/DB/database.dart';
import 'package:mega_store/config/theme/app_colors.dart';
import 'package:mega_store/config/theme/app_sizes.dart';
import 'package:mega_store/features/auth/register_page.dart';
import 'package:mega_store/features/products/home_page.dart';
import 'package:mega_store/helpers/validator.dart';
import 'package:string_validator/string_validator.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  String password = "";
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String email = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 127),
                    Text(
                      "Welcome back to \nMega Store",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Please enter your data to login",
                      style: TextStyle(
                          color: AppColors.grey,
                          fontWeight: FontWeight.w300,
                          fontSize: 14),
                    ),
                    const SizedBox(height: 50),
                    Text(
                      "Email/Phone",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(height: 20),
                    Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: AppSizes.getDeviceWidth(context) * .9,
                            child: TextFormField(
                              initialValue: email,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter your email";
                                } else if (!isEmail(value)) {
                                  return "Please enter a valid email";
                                } else if (!Validator.isUserExists(value)) {
                                  return "This user doesn't exist";
                                }
                                return null;
                              },
                              onChanged: (value) {
                                email = value;
                              },
                              decoration: InputDecoration(
                                hintText: "Enter your email",
                                fillColor: AppColors.lightGrey,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          Text(
                            "Password",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: AppSizes.getDeviceWidth(context) * .9,
                            child: TextFormField(
                              initialValue: password,
                              obscureText: true,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter your password";
                                } else if (!Validator.isCorrectPassword(value, email)) {
                                  return "Wrong Password";
                                }
                                return null;
                              },
                              onChanged: (value) {
                                password = value;
                              },
                              decoration: InputDecoration(
                                hintText: "Enter your Password",
                                fillColor: AppColors.lightGrey,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 70),
                          Center(
                            child: GestureDetector(
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text(
                                      "Logged in Successfully",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    backgroundColor: Colors.green,
                                  ));

                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) => HomePage()),
                                  );

                                  Database.authenticatedUser = email;
                                }
                              },
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  color: AppColors.blue,
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                ),
                                width: AppSizes.getDeviceWidth(context) * .8,
                                child: Center(
                                  child: Text(
                                    "Sign In",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 50),
                    Align(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Forgot Password",
                            style: TextStyle(
                                color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => RegisterPage())),
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                  color: AppColors.blue, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}