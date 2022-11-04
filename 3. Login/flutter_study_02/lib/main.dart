import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SJ flutter',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: const LoginSignupPage(),
    );
  }
}

class LoginSignupPage extends StatefulWidget {
  const LoginSignupPage({Key? key}) : super(key: key);

  @override
  State<LoginSignupPage> createState() => _LoginSignupPageState();
}

class _LoginSignupPageState extends State<LoginSignupPage> {
  final _formkey = GlobalKey<FormState>();

  bool isLogin = true;
  bool isLoginTab = true;
  bool isSignupTab = false;
  late List<bool> isSelected;

  void initState() {
    isSelected = [isLoginTab, isSignupTab];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ToggleButtons(
                    children: <Widget>[
                      Icon(Icons.login),
                      Icon(Icons.add),
                    ],
                    isSelected: isSelected,
                    onPressed: toggleSelect,
                  ),
                ],
              ),
            ),
            if (isLogin)
              Container(
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      TextFormField(
                        key: ValueKey(1),
                        onSaved: (s) {
                          debugPrint('on Save: $s');
                        },
                        onChanged: (s) {
                          debugPrint('on Changed: $s');
                        },
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.account_circle,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      TextFormField(
                        key: ValueKey(2),
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      TextFormField(
                        key: ValueKey(3),
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("Login",
                            style: TextStyle(color: Colors.white)),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green),
                          padding: MaterialStateProperty.all(
                            EdgeInsets.all(10.0),
                          ),
                          overlayColor:
                              MaterialStateProperty.all(Colors.lightGreen),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            if (!isLogin)
              Form(
                key: _formkey,
                child: Column(
                  children: [
                    TextFormField(
                      key: ValueKey(4),
                      onSaved: (s) {
                        debugPrint('on Save: $s');
                      },
                      onChanged: (s) {
                        debugPrint('on Changed: $s');
                      },
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    TextFormField(
                      key: ValueKey(5),
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.password_outlined,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    TextFormField(
                      key: ValueKey(6),
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.password_rounded,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Sign Up",
                          style: TextStyle(color: Colors.white)),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green),
                        padding: MaterialStateProperty.all(
                          EdgeInsets.all(10.0),
                        ),
                        overlayColor:
                            MaterialStateProperty.all(Colors.lightGreen),
                      ),
                    )
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  void toggleSelect(value) {
    if (value == 0) {
      isLoginTab = true;
      isSignupTab = false;
      isLogin = true;
    } else {
      isLoginTab = false;
      isSignupTab = true;
      isLogin = false;
    }
    setState(() {
      isSelected = [isLoginTab, isSignupTab];
    });
  }
}
