import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

var userName = ['user1', 'user2', 'user3'];
var password = ['password1', 'password2', 'password3'];

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/register': (context) => RegisterPage()
      },
      //title: 'Sign-in',
      //home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  //MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final enteredPswrd = new TextEditingController();
  final enteredUsr = new TextEditingController();
  final errorBar = SnackBar(content: Text('Wrong Details Entered'));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                  width: 200,
                  height: 150,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: enteredUsr,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Username',
                    hintText: 'Enter Username'),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 15.0, top: 15.0, right: 15.0, bottom: 15.0),
              child: TextField(
                  controller: enteredPswrd,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter Password',
                  ),
                  obscureText: true),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
              ),
              child: Text(
                'Login',
              ),
              onPressed: () {
                setState(() {
                  enteredUsr.text;
                  enteredPswrd.text;
                });
                if (userName.contains(enteredUsr.text) &
                    (password.contains(enteredPswrd.text))) {
                  Navigator.pushNamed(context, '/home');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(errorBar);
                }
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
              ),
              child: Text('Register'),
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
            )
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('HomePage'),
          backgroundColor: Colors.green,
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 180,
                  width: 180,
                  child: Card(
                    color: Colors.green,
                    child: ListTile(
                      title: Text(
                        'ACCOUNT BALANCE 20,000',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    margin: EdgeInsets.all(20),
                  ),
                ),
                Container(
                  height: 180,
                  width: 180,
                  child: Card(
                    color: Colors.green,
                    child: ListTile(
                        title: Text(
                      'QUICK TRANSFER',
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    )),
                    margin: EdgeInsets.all(20),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Container(
                  height: 180,
                  width: 180,
                  child: Card(
                    color: Colors.green,
                    child: ListTile(
                        title: Text(
                      'History',
                      style: TextStyle(color: Colors.white, fontSize: 30.0),
                    )),
                    margin: EdgeInsets.all(20),
                  ),
                ),
                Container(
                  height: 180,
                  width: 180,
                  child: Card(
                    color: Colors.green,
                    child: ListTile(
                        title: Text(
                      'ACCOUNT STATEMENT',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    )),
                    margin: EdgeInsets.all(20),
                  ),
                )
              ],
            ),
          ],
        ));
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final newPswrd = new TextEditingController();
  final confirmPswrd = new TextEditingController();
  final newUsr = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Register Page'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              controller: newUsr,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                  hintText: 'Enter Username'),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              controller: newPswrd,
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Enter Password'),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              controller: confirmPswrd,
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Confirm Password',
                  hintText: 'Confirm Password'),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.green,
            ),
            child: Text('Register'),
            onPressed: () {
              setState(() {
                newUsr.text;
                newPswrd.text;
                confirmPswrd.text;
              });
              if (newPswrd.text == confirmPswrd.text) {
                userName.add(newUsr.text);
                password.add(newPswrd.text);
                Navigator.pushNamed(context, '/home');
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Password Not Confirmed!')));
              }
            },
          )
        ],
      ),
    );
  }
}
