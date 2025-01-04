import 'package:flutter/material.dart';
import 'package:mega_store/DB/database.dart';
import 'package:mega_store/config/theme/app_colors.dart';
import 'package:mega_store/config/theme/app_sizes.dart';
import 'package:mega_store/features/auth/login_page.dart';
import 'package:mega_store/helpers/validator.dart';
import 'package:mega_store/models/user_model.dart';
import 'package:string_validator/string_validator.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  String password = "";
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String email = "";
  String name = "";
  String phoneNumber = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Text(     
                    "Hello there, let's create your account",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Please enter your data to register",
                    style: TextStyle(
                        color: AppColors.grey,
                        fontWeight: FontWeight.w300,
                        fontSize: 14),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Email/Phone",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
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
                              onChanged: (value) => email = value,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter an email";
                                } else if (!value.isEmail) {
                                  return "Please enter a valid email";
                                } else if (!Validator.isUniqueEmail(email)) {
                                  return "This email is already in use";
                                } else {
                                  return null;
                                }
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
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            "Password",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: AppSizes.getDeviceWidth(context) * .9,
                            child: TextFormField(
                              initialValue: password,
                              onChanged: (value) => password = value,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter a password";
                                } else {
                                  if (value.length < 6) {
                                    return "Please enter a strong password with at least 6 characters";
                                  } else {
                                    return null;
                                  }
                                }
                              },
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: "Enter a password",
                                fillColor: AppColors.lightGrey,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            "Phone Number",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: AppSizes.getDeviceWidth(context) * .9,
                            child: TextFormField(
                              initialValue: phoneNumber,
                              onChanged: (value) => phoneNumber = value,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter your phone number";
                                } else {
                                  if (value.length < 8) {
                                    return "Please enter a valid phone number";
                                  } else {
                                    return null;
                                  }
                                }
                              },
                              decoration: InputDecoration(
                                hintText: "Enter your phone number",
                                fillColor: AppColors.lightGrey,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Text(
                            "Name",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: AppSizes.getDeviceWidth(context) * .9,
                            child: TextFormField(
                              initialValue: name,
                              onChanged: (value) => name = value,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter your name";
                                } else {
                                  if (!value.isAlpha) {
                                    return "Please enter a correct name";
                                  } else {
                                    return null;
                                  }
                                }
                              },
                              decoration: InputDecoration(
                                hintText: "Enter your name",
                                fillColor: AppColors.lightGrey,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 70,
                          ),
                          Center(
                            child: GestureDetector(
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(
                                      "Your account has been created successfully",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    backgroundColor: Colors.green,
                                  ));
                                  Database.users.add(UserModel(
                                      name: name,
                                      email: email,
                                      password: password,
                                      phoneNumber: phoneNumber));
                                }
                              },
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    color: AppColors.blue,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10))),
                                width: AppSizes.getDeviceWidth(context) * .8,
                                child: Center(
                                  child: Text(
                                    "Sign Up",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => LoginPage())),
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: AppColors.blue,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
