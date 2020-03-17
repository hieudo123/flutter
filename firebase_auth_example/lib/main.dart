import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_example/home_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Firebase Authenticate'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String emailAddress, password, error = '';

  Future<void> registerUser() async {
    _auth
        .createUserWithEmailAndPassword(email: emailAddress, password: password)
        .then((value) {
//      value.user
//          .sendEmailVerification()
//          .then((value) => print('Send email Successs : '), onError: (error) {
//        print('send email fail');
//      });
      print("Register success : $value");
    }).catchError((error) {
      print("Register fail : $error");
    });
  }

  Future<void> login() async {
    _auth
        .signInWithEmailAndPassword(email: emailAddress, password: password)
        .then((value) {
      print("Login success : $value");
      if (value.user.isEmailVerified) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ));
      } else
        this.error = 'Try verifying your email first';
    }).catchError((error) {
      print("Login fail : $error");
      setState(() {
        this.error = error.toString();
      });
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Email Address',
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
                textAlign: TextAlign.center,
                onChanged: (value) {
                  emailAddress = value;
                },
              ),
              SizedBox(
                height: 5.0,
              ),
              TextField(
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
                onChanged: (value) {
                  password = value;
                },
              ),
              SizedBox(
                height: 24.0,
              ),
              Container(
                width: double.infinity,
                child: RaisedButton(
                  onPressed: () {
                    registerUser();
                  },
                  child: Text(
                    "Register",
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                  color: Colors.blue,
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              Container(
                width: double.infinity,
                child: RaisedButton(
                  onPressed: () {
                    login();
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                  color: Colors.blue,
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              Container(
                width: double.infinity,
                child: RaisedButton(
                  onPressed: () {
                    sendMailResetPassword();
                  },
                  child: Text(
                    "Forgot password",
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                  color: Colors.blue,
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> sendMailResetPassword() async {
    if (emailAddress.isNotEmpty){
      _auth.sendPasswordResetEmail(email: emailAddress).then((value) {
        print('Send password reset email success');
      }, onError: (error) {
        print('Send password reset email fail : ${error.toString()}');
      });
    }
  }
}
