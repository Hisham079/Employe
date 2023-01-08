import 'package:employe_project/signin/view/signin.dart';
import 'package:employe_project/signup/view/widget/button_widget.dart';
import 'package:employe_project/signup/view/widget/text_field.dart';
import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../home/view/homePage.dart';
import '../bloc/authentication_bloc.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});
  final _emailController = TextEditingController(),
      _passwordController = TextEditingController(),
      _nameController = TextEditingController(),
      _phoneNoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final auth_bloc = AuthenticationBloc();
    return BlocProvider(
      create: (context) => auth_bloc,
      child: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SigninPage(),
                ));
          } else {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Register Failed')));
          }
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 31, 73, 107),
            title: Text('Sign up'),
          ),
          body: SingleChildScrollView(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10, top: 120, bottom: 20),
                  child: Text(
                    'Sign Up',
                    style: GoogleFonts.rowdies(fontSize: 25.sp),
                  ),
                ),
                TextFieldWdgt(
                  controller: _nameController,
                  name: 'Name',
                  hint: 'Enter your name',
                ),
                TextFieldWdgt(
                  controller: _phoneNoController,
                  name: 'Mobile No',
                  hint: 'Enter your mobile no',
                ),
                TextFieldWdgt(
                  controller: _emailController,
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
                      controller: _passwordController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r)),
                          hintText: 'Create a password'),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    auth_bloc.add(UserRegisterEvent(
                        name: _nameController.text,
                        mobileNo: _phoneNoController.text,
                        email: _emailController.text,
                        password: _passwordController.text));
                  },
                  child: BtnWdgt(
                    name: 'Create account',
                    raduis: 10,
                    clr: Color.fromARGB(255, 31, 73, 107),
                  ),
                ),
                SizedBox(
                  height: 30,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: GoogleFonts.laila(color: Colors.black54),
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SigninPage(),
                                ));
                          },
                          child: Text(
                            ' Log in',
                            style: TextStyle(color: Colors.blue, fontSize: 12.sp),
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.h,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'For Testing',
                        style: GoogleFonts.laila(color: Colors.black54),
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomePage(),
                                ));
                          },
                          child: Text(
                            ' Employee',
                            style: TextStyle(color: Colors.blue),
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
    //   ),
    // );
  }
}
