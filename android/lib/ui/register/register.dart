import 'package:flutter/material.dart';
import 'package:flutter_login_practice/common/color_values.dart';
import 'package:flutter_login_practice/common/shared_code.dart';
import 'package:flutter_login_practice/ui/widgets/custom_text_field.dart';
import 'package:google_fonts/google_fonts.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController1 = TextEditingController();
  final TextEditingController _passwordController2 = TextEditingController();

  void _register() {
    if (_formKey.currentState!.validate()) {
      if (_passwordController1.text == _passwordController2.text) {
        SharedCode.showSnackBar(context, 'success', 'Account created.');
      } else {
        SharedCode.showSnackBar(context, 'error', 'Password doesn\'t match.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
        child: Column(
          children: [
            _buildHeading(),
            const SizedBox(height: 20.0),
            _buildContent(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeading() {
    return Column(
      children: [
        Text('Create Account', style: Theme.of(context).textTheme.headline1),
        const SizedBox(height: 5.0),
        Text('Create a new account', style: Theme.of(context).textTheme.subtitle1),
      ],
    );
  }

  Widget _buildContent() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextField(
            label: 'Name',
            controller: _nameController,
            prefixIcon: Icons.person_outline,
          ),
          const SizedBox(height: 10.0),
          CustomTextField(
            label: 'Email',
            controller: _emailController,
            prefixIcon: Icons.email_outlined,
            validator: (value) => SharedCode().emailValidator(value)
          ),
          const SizedBox(height: 10.0),
          CustomTextField(
            label: 'Phone',
            controller: _phoneController,
            prefixIcon: Icons.phone_android_outlined,
            validator: (value) => SharedCode().phoneValidator(value),
            textInputType: TextInputType.number,
          ),
          const SizedBox(height: 10.0),
          CustomTextField(
            label: 'Password',
            controller: _passwordController1,
            prefixIcon: Icons.lock_outlined,
            validator: (value) => SharedCode().passwordValidator(value),
            isPassword: true,
          ),
          const SizedBox(height: 10.0),
          CustomTextField(
            label: 'Confirm Password',
            controller: _passwordController2,
            prefixIcon: Icons.lock_outlined,
            validator: (value) => SharedCode().passwordValidator(value),
            isPassword: true,
          ),
          const SizedBox(height: 25.0),
          ElevatedButton(onPressed: _register, child: const Text('CREATE ACCOUNT')),
          const SizedBox(height: 25.0),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: RichText(
              text: TextSpan(
                  text: 'Already have an account? ',
                  style: Theme.of(context).textTheme.bodyText1,
                  children: <TextSpan>[
                    TextSpan(text: 'Login',
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
