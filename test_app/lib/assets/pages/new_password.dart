import 'package:flutter/material.dart';
import 'package:test_app/assets/pages/dashboard.dart';
import 'package:test_app/assets/pages/login_page.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  final _formfield = GlobalKey<FormState>();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool passToggle2 = true;
  bool passToggle1 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 220, 237, 250),
      appBar: AppBar(
        title: const Text("New Password"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
          child: Form(
            key: _formfield,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/Lock.png",
                  width: 200,
                ),
                const SizedBox(height: 50),
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: newPasswordController,
                  obscureText: passToggle1,
                  decoration: InputDecoration(
                    labelText: "New Password",
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(
                          () {
                            passToggle1 = !passToggle1;
                          },
                        );
                      },
                      child: Icon(passToggle1
                          ? Icons.visibility
                          : Icons.visibility_off),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter new Password";
                    } else if (newPasswordController.text.length < 8) {
                      return "Password Length Should be more than 8 characters";
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: confirmPasswordController,
                  obscureText: passToggle2,
                  decoration: InputDecoration(
                    labelText: "Conform Password",
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(
                          () {
                            passToggle2 = !passToggle2;
                          },
                        );
                      },
                      child: Icon(passToggle2
                          ? Icons.visibility
                          : Icons.visibility_off),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Password";
                    } else if (confirmPasswordController.text.length < 8) {
                      return "Password Length Should be more than 8 characters";
                    } else if (newPasswordController.text !=
                        confirmPasswordController.text) {
                      return "Password does not match";
                    }
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const Login()));
                      },
                      child: const Text(
                        "Back to Sign in",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
                InkWell(
                  onTap: () {
                    if (_formfield.currentState!.validate()) {
                      print("success");
                      print(newPasswordController.text);
                      print(confirmPasswordController.text);

                      newPasswordController.clear();
                      confirmPasswordController.clear();
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Dashboard()));
                    }
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.indigo,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Center(
                      child: Text(
                        "Log In",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
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
