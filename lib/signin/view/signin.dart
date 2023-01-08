import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../home/view/homePage.dart';
import '../../signup/view/widget/button_widget.dart';
import '../../signup/view/widget/text_field.dart';
import '../bloc/signin_bloc.dart';

class SigninPage extends StatefulWidget {
  SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController _loginEmail = TextEditingController(),
      _loginPassword = TextEditingController();
  final auth_bloc = SigninBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => auth_bloc,
      child: BlocListener<SigninBloc, SigninState>(
        listener: (context, state) {
          if (state is LoginSucces) {
            //print('successowedosjf');
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
            title: Text('Sign in'),
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
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    'Password',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: SizedBox(
                    height: 50.h,
                    width: 331.w,
                    child: TextFormField(
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      controller: _loginPassword,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r)),
                          hintText: 'Enter your password'),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    auth_bloc.add(UserLoginEvent(
                        email: _loginEmail.text,
                        password: _loginPassword.text));
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
