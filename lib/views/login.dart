import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thirumathikart_delivery/constants/navigation_routes.dart';
import 'package:thirumathikart_delivery/controllers/auth_controller.dart';
// import 'package:thirumathikart_delivery/widgets/app_bar.dart';
import 'package:thirumathikart_delivery/widgets/button/login_button.dart';

class LoginPage extends GetView<AuthController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
        child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: deviceHeight,
            ),
            child: Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Center(
                    child: Card(
                        elevation: 12,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            color: Colors.black12,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(children: <Widget>[
                              const SizedBox(
                                height: 30,
                              ),
                              Center(
                                child: Image.asset(
                                  'assets/tklogo.jpeg',
                                  height: 200,
                                ),
                              ),
                              Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Column(children: <Widget>[
                                    Container(
                                      margin: const EdgeInsets.only(
                                          top: 15, left: 10, right: 10),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Material(
                                        color: Colors.white,
                                        shadowColor: Colors.black,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10)),
                                        elevation: 2,
                                        child: Center(
                                          child: TextFormField(
                                            decoration: const InputDecoration(
                                              hintText: 'Enter mail-id',
                                              border: InputBorder.none,
                                              contentPadding: EdgeInsets.only(
                                                  left: 20.0, right: 20),
                                            ),
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            controller: controller
                                                .userNameTextController,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          top: 20, left: 10, right: 10),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.black,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Material(
                                        color: Colors.white,
                                        shadowColor: Colors.black,
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        elevation: 2,
                                        child: SizedBox(
                                          child: Center(
                                            child: TextFormField(
                                              obscureText: true,
                                              decoration: const InputDecoration(
                                                hintText: 'Enter Password',
                                                border: InputBorder.none,
                                                contentPadding: EdgeInsets.only(
                                                    left: 20.0, right: 20),
                                              ),
                                              controller: controller
                                                  .passwordTextController,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const LoginButton(),
                                  ])),
                              const SizedBox(
                                height: 70,
                              ),
                              Container(
                                  margin: const EdgeInsets.only(bottom: 40),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                            onTap: () {
                                               Get.toNamed(
                                                NavigationRoutes.forgotPassword);
                                            },
                                            child: const Text(
                                              'Forgot Password',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Color.fromARGB(
                                                      255, 10, 49, 176),
                                                  fontFamily: 'Avenir',
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle: FontStyle.normal),
                                            ))
                                      ]))
                            ])))))));
  }
}
