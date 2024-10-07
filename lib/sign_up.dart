import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_ios_new_sharp,
              color: Colors.black,
            ),
          ),
        ),
        body: Container(
          color: Colors.white,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Opacity(
                    opacity: 0.3,
                    child: Image.asset(
                      alignment: Alignment.center,
                      "assets/images/app_logo.png",
                      width: 180,
                      height: 180,
                    ),
                  ),
                ),
                Text(
                  "Let's Begin!",
                  style: GoogleFonts.roboto(
                    color: const Color.fromARGB(255, 57, 57, 57),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Please enter your credentials to proceed",
                  style: GoogleFonts.roboto(
                    color: const Color.fromARGB(255, 120, 120, 120),
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Your Email",
                    labelStyle: TextStyle(
                      color: Color.fromARGB(255, 143, 140, 140),
                    ),
                  ),
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Create Password",
                    labelStyle: const TextStyle(
                      color: Color.fromARGB(255, 143, 140, 140),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                      ),
                    ),
                  ),
                  obscureText: _obscureText,
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Referral Code (Optional)",
                    labelStyle: TextStyle(
                      color: Color.fromARGB(255, 143, 140, 140),
                    ),
                  ),
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: SizedBox(
          width: 64,
          child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: const Color.fromARGB(215, 215, 26, 33),
            child: const Icon(
              Icons.arrow_forward_sharp,
              color: Colors.white,
              size: 30,
            ),
          ),
        ));
  }
}
