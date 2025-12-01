import 'package:flutter/material.dart';
import 'package:flutter_app/login_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final RegExp usernameRegx = RegExp(r'^[a-zA-Z][a-zA-Z0-9_]{5,}$');
  final RegExp emailRegex = RegExp(
    r'^[a-zA-Z][\w-]+@([a-zA-Z]+\.)[a-zA-Z]{2,4}$',
  );
  bool hidden = true;
  bool confirmHidden = true;
  bool checked = true;
  TextEditingController passwordController = TextEditingController();
  Map errors = {
    'username': [
      'username is required',
      'username must have more than 5 characters(a-z,A-Z,0-9,_)',
    ],
    'email': [
      'email is required',
      'email must be (a-z,A-Z,0-9,_,-)@(a-z,A-Z).(a-z,A-Z)',
    ],
    'password': [
      'password is required',
      'password must be more than 6 characters',
    ],
    'confirm_password': 'password is required',
  };
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 50),
              child: Text(
                'LOGO.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text('create an new account', style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
            Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return errors['username'][0];
                      } else if (!usernameRegx.hasMatch(value)) {
                        return errors['username'][1];
                      }
                      return null;
                    },
                    cursorColor: Colors.grey,
                    style: TextStyle(fontSize: 17),
                    cursorHeight: 22,
                    decoration: InputDecoration(
                      floatingLabelStyle: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      labelText: 'User Name',
                      labelStyle: TextStyle(fontSize: 16),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return errors['email'][0];
                      } else if (!emailRegex.hasMatch(value)) {
                        return errors['email'][1];
                      }
                      return null;
                    },
                    cursorColor: Colors.grey,
                    style: TextStyle(fontSize: 17),
                    cursorHeight: 22,
                    decoration: InputDecoration(
                      floatingLabelStyle: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      labelText: 'Email',
                      labelStyle: TextStyle(fontSize: 16),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  TextFormField(
                    controller: passwordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return errors['password'][0];
                      } else if (value.length < 6) {
                        return errors['password'][1];
                      }
                      return null;
                    },
                    obscureText: hidden,
                    cursorColor: Colors.grey,
                    style: TextStyle(fontSize: 17),
                    cursorHeight: 22,
                    decoration: InputDecoration(
                      floatingLabelStyle: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      labelText: 'Password',
                      labelStyle: TextStyle(fontSize: 16),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      suffix: IconButton(
                        onPressed: () {
                          setState(() {
                            hidden = !hidden;
                          });
                        },
                        icon: Icon(
                          hidden
                              ? Icons.visibility_off_rounded
                              : Icons.visibility,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return errors['confirm_password'];
                      } else if (value.length < 6) {
                        return errors['password'][1];
                      } else if (passwordController.text != value) {
                        return 'Password doesn\'t match';
                      }
                      return null;
                    },
                    obscureText: confirmHidden,
                    cursorColor: Colors.grey,
                    style: TextStyle(fontSize: 17),
                    cursorHeight: 22,
                    decoration: InputDecoration(
                      floatingLabelStyle: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      labelText: 'Confirm Password',
                      labelStyle: TextStyle(fontSize: 16),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      suffix: IconButton(
                        onPressed: () {
                          setState(() {
                            confirmHidden = !confirmHidden;
                          });
                        },
                        icon: Icon(
                          confirmHidden
                              ? Icons.visibility_off_rounded
                              : Icons.visibility,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: checked,
                        onChanged: (val) {
                          setState(() {
                            checked = val!;
                          });
                        },
                        activeColor: Colors.black,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            checked = !checked;
                          });
                        },
                        child: Text(
                          'I am agree Terms & Conditions',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  MaterialButton(
                    onPressed: () {
                      if (!formKey.currentState!.validate() && checked) {
                      } else if (!checked) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'You should agree Terms & Conditions',
                            ),
                          ),
                        );
                      } else {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return LoginPage();
                            },
                          ),
                        );
                      }
                    },
                    color: Colors.black,
                    textColor: Colors.white,
                    minWidth: 350,
                    padding: EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(30),
                    ),
                    child: Text(
                      'Create Account',
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
