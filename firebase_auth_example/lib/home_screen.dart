import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirebaseUser _firebaseUser;
  String displayName, newPassword = '';

  Future<void> getUser() async {
    FirebaseAuth.instance.currentUser().then((value) {
      setState(() {
        _firebaseUser = value;
        print("User : $value");
      });
    });
  }

  Future<void> addUsername() async {
    if (displayName.trim().isNotEmpty) {
      UserUpdateInfo userUpdateInfo = UserUpdateInfo();
      userUpdateInfo.displayName = displayName;
      _firebaseUser.updateProfile(userUpdateInfo).then((value) {
        print('update success : ');
        getUser();
      }, onError: (error) {
        print('update faile : $error');
      });
    }
  }

  @override
  void initState() {
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home screen'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                _firebaseUser != null
                    ? 'Display name : ${_firebaseUser.displayName}'
                    : '',
                textAlign: TextAlign.center,
              ),
              Text(
                _firebaseUser != null ? 'Email : ${_firebaseUser.email}' : '',
                textAlign: TextAlign.center,
              ),
              Text(
                _firebaseUser != null ? 'Email : ${_firebaseUser.uid}' : '',
                textAlign: TextAlign.center,
              ),
              RaisedButton(
                onPressed: () {
                  logOut();
                },
                child: Text('Log out'),
              ),
              SizedBox(
                height: 96.0,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Display Name',
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
                  displayName = value;
                },
              ),
              RaisedButton(
                onPressed: () {
                  addUsername();
                },
                child: Text('Add display name'),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'New password',
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
                  newPassword = value;
                },
              ),
              RaisedButton(
                onPressed: () {
                  changePassword();
                },
                child: Text('Change password'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> changePassword() async {
    if(newPassword.isNotEmpty){
      _firebaseUser.updatePassword(newPassword).then((value) => logOut(),
          onError: (error) {
            print('Change password fail : $error');
          });
    }
  }

  Future<void> logOut() async {
    FirebaseAuth.instance
        .signOut()
        .then((value) => Navigator.pop(context))
        .then((value) => print('Log out Error : $value'));
  }
}
