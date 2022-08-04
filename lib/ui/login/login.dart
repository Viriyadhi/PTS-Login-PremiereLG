import 'package:flutter/material.dart';
import 'package:flutter_login_practice/common/color_values.dart';
import 'package:flutter_login_practice/common/shared_code.dart';
import 'package:flutter_login_practice/ui/register/register.dart';
import 'package:flutter_login_practice/ui/widgets/custom_text_field.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    if (_formKey.currentState!.validate()) {
      if (_emailController.text == 'admin@gmail.com' && _passwordController.text == 'admin') {
        SharedCode.showSnackBar(context, 'success', 'Login successful.');
      } else {
        SharedCode.showSnackBar(context, 'error', 'Email or password incorrect.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildHeading(),
              const SizedBox(height: 50.0),
              _buildContent(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeading() {
    return Column(
      children: [
        Container(
          width: 90.0,
          height: 90.0,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/welcome.png'),
              opacity: 0.1
            ),
          ),
        ),
        const SizedBox(height: 5.0),
        Text('Welcome Back', style: Theme.of(context).textTheme.headline1),
        const SizedBox(height: 5.0),
        Text('Sign to continue', style: Theme.of(context).textTheme.subtitle1),
      ],
    );
  }
  
  Widget _buildContent() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextField(
            label: 'Email',
            controller: _emailController,
            prefixIcon: Icons.email_outlined,
            validator: (value) => SharedCode().emailValidator(value)
          ),
          const SizedBox(height: 10.0),
          CustomTextField(
            label: 'Password',
            controller: _passwordController,
            prefixIcon: Icons.lock_outlined,
            isPassword: true
          ),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('Forgot password?', style: GoogleFonts.lato(color: ColorValues.primaryGreen, fontWeight: FontWeight.w600))
            ],
          ),
          const SizedBox(height: 25.0),
          ElevatedButton(onPressed: _login, child: const Text('LOGIN')),
          const SizedBox(height: 20.0),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Register()));
            },
            child: RichText(
              text: TextSpan(
                text: 'Don\'t have account? ',
                style: Theme.of(context).textTheme.bodyText1,
                children: <TextSpan>[
                  TextSpan(text: 'Create a new account',
                    style: GoogleFonts.lato(fontSize: 14.0, fontWeight: FontWeight.w600, color: ColorValues.primaryGreen),
                  )
                ]
              ),
            ),
          ),
        ],
      ),
    );
  }
}
