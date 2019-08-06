import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_provider/database/database_provider.dart';
import 'package:flutter_state_provider/model/user.dart';
import 'package:flutter_state_provider/widget/user_list.dart';
import 'package:provider/provider.dart';

class LoginApp extends StatelessWidget {
  DatabaseProvider db = DatabaseProvider();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<FirebaseUser>.value(
          value: FirebaseAuth.instance.onAuthStateChanged,
        ),
        StreamProvider<List<User>>.value(
          value: db.getUsers(),
        ),
      ],
      child: MaterialApp(
        title: '인증 프로바이더',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginPage(),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  Map data = Map();

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<FirebaseUser>(context);
    var loggedIn = user != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "로긴 페이지",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: <Widget>[
          if (loggedIn) ...[
            RaisedButton(child: Text("Sign out"), onPressed: auth.signOut),
            UserList(),
          ],
          if (!loggedIn) ...[
            TextFormField(
              controller: emailCtrl,
              decoration: InputDecoration(
                  icon: Icon(Icons.email), hintText: '이메일을 적어주세요.'),
            ),
            TextFormField(
              controller: passwordCtrl,
              decoration: InputDecoration(
                  icon: Icon(Icons.keyboard), hintText: '비밀번호를 적어주세요.'),
              obscureText: true,
            ),
            RaisedButton(
              child: Text("Sign up"),
              onPressed: signUp,
            )
          ]
        ],
      ),
    );
  }

  void signUp() {
    String email = emailCtrl.text;
    String password = passwordCtrl.text;
    auth.createUserWithEmailAndPassword(email: email, password: password);

    emailCtrl.clear();
    passwordCtrl.clear();
  }
}
