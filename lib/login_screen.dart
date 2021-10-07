import 'package:flutter/material.dart';
import 'home_screen.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF252525),
        body: SingleChildScrollView(
          child: Container(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height,
                maxWidth: MediaQuery.of(context).size.width,
              ),
              decoration: BoxDecoration(color: Colors.grey[80]),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                    Image.asset('assets/DBP.png',
                        width: 200, height: 200, alignment: Alignment.center),
                    Column(children: [
                      Text(
                        "Bank with DBP",
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 40,
                          fontWeight: FontWeight.w900,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                      Text("Where YOU are the FIRST!",
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 18,
                              fontWeight: FontWeight.w900),
                          textAlign: TextAlign.center),
                    ]),
                    LoginForm()
                  ],
                ),
              )),
        ));
  }
}

class LoginForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.red)),
                      filled: true,
                      fillColor: Color(0xFF252525),
                      hintText: "\tUser ID",
                      hintStyle: TextStyle(fontSize: 20, color: Colors.white),
                      prefixIcon:
                          Icon(Icons.person, size: 45, color: Colors.blue[900]),
                      errorStyle: TextStyle(height: 0)),
                  validator: (value) => value == "Admin" ? null : ''),
              Padding(padding: EdgeInsets.symmetric(vertical: 5)),
              TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none),
                      filled: true,
                      fillColor: Color(0xFF252525),
                      hintText: "\tPassword",
                      hintStyle: TextStyle(fontSize: 20, color: Colors.white),
                      prefixIcon: Icon(Icons.lock, color: Colors.orange[800]),
                      errorStyle: TextStyle(height: 0)),
                  validator: (value) => value == "Admin" ? null : ''),
              Padding(padding: EdgeInsets.symmetric(vertical: 5)),
              Container(
                  width: double.infinity,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Column(children: [
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomeScreen()));
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text(
                                        'Invalid credentials. Please try again!')));
                              }
                            },
                            child: Text("Login",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16)),
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18))),
                                elevation:
                                    MaterialStateProperty.all<double>(0)),
                          ),
                        )
                      ])))
            ],
          ),
        ));
  }
}
