import 'package:employe_project/home/view/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../signup/view/widget/button_widget.dart';
import '../../signup/view/widget/text_field.dart';
import '../bloc/signin_bloc.dart';

class SigninPage extends StatelessWidget {
  SigninPage({super.key});
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    TextEditingController _loginEmail = TextEditingController(),
        _loginPassword = TextEditingController();
    final auth_bloc = SigninBloc();
    return BlocProvider(
      create: (context) => auth_bloc,
      child: BlocListener<SigninBloc, SigninState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            print('successowedosjf');
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ));
          } else if (state is LoginFailed) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error_message)));
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text('Signin'),
            backgroundColor: Color.fromARGB(255, 31, 73, 107),
          ),
          body: SingleChildScrollView(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10, top: 150, bottom: 20),
                  child: Text(
                    'Sign in',
                    style: GoogleFonts.rowdies(fontSize: 25),
                  ),
                ),
                TextFieldWdgt(
                  controller: _loginEmail,
                  name: 'Email',
                  hint: 'Enter your email',
                ),
                TextFieldWdgt(
                  controller: _loginPassword,
                  name: 'Password',
                  hint: 'Create a password',
                ),
                GestureDetector(
                  onTap: () async {
                    try {
                      await _auth.signInWithEmailAndPassword(
                          email: _loginEmail.text.toString(),
                          password: _loginPassword.text.toString());
                      if (_auth.currentUser != null) {
                        return print('Login success');
                      } else {
                        return print('failed');
                      }
                      //(email.toString()+"loginsuccess");

                      //  (LoginSuccess());
                    } on FirebaseAuthException catch (e) {
                      print(e.toString());
                      (_loginEmail.toString() + "loginsuccess");
                      (_loginPassword.toString() + "loginsuccess");

                      //   (LoginFailed(error_message: e.code));
                    }

                    // auth_bloc.add(UserLoginEvent(
                    //     email: _loginEmail.text.trim().toString(),
                    //     password: _loginPassword.text.trim().toString()));
                  },
                  child: BtnWdgt(
                    name: 'Login account',
                    raduis: 10,
                    clr: Color.fromARGB(255, 31, 73, 107),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
