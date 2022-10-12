
import 'package:firebase_the_tech_course/ui/auth/signup_screen.dart';
import 'package:firebase_the_tech_course/widgets/round_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordlController = TextEditingController();
  final _fomekey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordlController.dispose();
  }
  

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async{
        SystemNavigator.pop();
        return true;
      },

      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Login"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Form(
                  key: _fomekey,
                  child: Column(
                    children: [
                      
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        decoration: InputDecoration(
                            hintText: "Email",
                            prefixIcon: Icon(Icons.alternate_email)),
                        validator: ((value) {
                          if (value!.isEmpty) {
                            return 'Enter Email';
                          } else if (!value.contains("@")) {
                            return "Plrase Enter valid Email ";
                          }
                          return null;
                        }),
                      ),
    
    
                      SizedBox(
                        height: 10,
                      ),
    
    
                      TextFormField(
                        controller: passwordlController,
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Password", prefixIcon: Icon(Icons.key)),
                        validator: ((value) {
                          if (value!.isEmpty) {
                            return 'Enter password';
                          }
                          return null;
                        }),
                      ),
                    ],
                  )),
    
    
              SizedBox(
                height: 50,
              ),
    
    
              RoundButton(
                title: "Login",
                onTap: (() {
                  if (_fomekey.currentState!.validate()) {}
                }),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),
                  TextButton(onPressed: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
                  }, child: Text("Sign Up"))
                ],
              )
              
            ],
          ),
        ),
      ),
    );
  }
}
