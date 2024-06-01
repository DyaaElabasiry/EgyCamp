import 'package:egycamp/general_widgets.dart';
import 'package:egycamp/main_screens/registered_screen.dart';
import 'package:egycamp/signup_screen/functions.dart';
import 'package:egycamp/signup_screen/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SigninScreen extends StatefulWidget {
  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  bool _checkboxvalue = true;
  String email = '';
  String password = '';
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Row(
        children: [
          Expanded(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        padding: const EdgeInsets.all(20), child: EgyCampLogo()),
                    Row(children: [
                      Expanded(
                        flex: 4,
                        child: SizedBox(),
                      ),
                      Expanded(
                        flex: 10,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Welcome back!',
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.w900)),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text('Enter your credentials to access your account',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w600)),
                            const SizedBox(
                              height: 40,
                            ),
                            const Text('Email address',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w600)),
                            const SizedBox(
                              height: 4,
                            ),
                            Container(
                              width: double.maxFinite,
                              height: 45,
                              child: TextFormField(
                                onChanged: (value) {
                                  email = value;
                                },
                                decoration: InputDecoration(
                                    hintText: 'Enter your email',
                                    border: const OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                    )),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your email';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            const Text('Password',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w600)),
                            const SizedBox(
                              height: 4,
                            ),
                            Container(
                              width: double.maxFinite,
                              height: 45,
                              child: TextFormField(
                                onChanged: (value) {
                                  password = value;
                                },
                                decoration: InputDecoration(
                                  hintText: 'Enter your password',
                                  border: const OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your email';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(children: [
                              Checkbox(
                                  value: _checkboxvalue,
                                  onChanged: (value) {
                                    setState(() {
                                      _checkboxvalue = !_checkboxvalue;
                                    });
                                  }),
                              Text('  Remember me' ,style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500),),
                
                
                            ]),
                            const SizedBox(
                              height: 15,
                            ),
                            InkWell(
                                onTap: () async{

                                  if (_formKey.currentState!.validate()) {
                                    var userCredentials =
                                        await signInUser(email, password, context);
                                    print('here');
                                    if (userCredentials != null) {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                RegisteredScreen()),
                                      );
                                    }
                                  }
                                },
                                child: Container(
                                  width: double.maxFinite,
                                  padding: const EdgeInsets.all(7),
                                  decoration: BoxDecoration(
                                      color: const Color.fromRGBO(55, 120, 159, 1),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: Text(
                                      'Sign in',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ),
                                )
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                                children:[
                                  Expanded(
                                    child: Container(
                                      height: 2,
                                      width: double.maxFinite,
                                      color: Colors.black12,
                                    ),
                                  ),
                                  const Text('  or  ',style: TextStyle(),),
                                  Expanded(
                                    child: Container(
                                      height: 2,
                                      width: double.maxFinite,
                                      color: Colors.black12,
                                    ),
                                  ),
                                ]
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.all(7),
                                    margin: const EdgeInsets.only(right: 5),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: const [
                                        Icon(Icons.facebook,color: Colors.blueAccent,),
                                        Text(' Facebook',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700),)
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: Colors.black12,width: 2)
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.all(1),
                                    margin: const EdgeInsets.only(left: 5),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children:  [
                                        Text("G",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700,color: Colors.red),),
                                        Text('  Google',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700),)
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: Colors.black12,width: 2)
                
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Expanded(child: SizedBox()),
                                const Text('have an account?  ',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400),),
                                InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupScreen()));
                                  },
                                  child: const Text('Sign up',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700,color: Color.fromRGBO(55, 120, 159, 1)),),
                                ),
                                Expanded(child: SizedBox()),
                              ],
                
                            )
                
                          ],
                        ),
                      ),
                      Expanded(flex: 3, child: SizedBox())
                    ])
                  ],
                ),
              )),
          Expanded(
              child: Container(
                height: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    bottomLeft: Radius.circular(25),
                  ),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/signin_sphinx.jpeg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
