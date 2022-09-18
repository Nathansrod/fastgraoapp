/*
* This file implements the login screen. It has two input fields
* one for e-mail (user) and the other for password.
*
* It has a submit button and a small text button with 'create an account' text
* */

import 'package:fastgrao_hackagrao2022/views/storage_list.dart';
import 'package:flutter/material.dart';
import '../utils/custom_layout_builder.dart';

class UserLogin extends StatefulWidget {
  const UserLogin({Key? key}) : super(key: key);

  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  final _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Image(image: AssetImage('assets/fastgraocomplete.png')),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Form(
                key: _loginFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text("Usuário (e-mail):", style: TextStyle(fontSize: 20.0, color: Theme.of(context).colorScheme.onPrimary)),
                    const SizedBox(height: 5.0,),
                    TextFormField(
                      decoration: CustomLayoutBuilder.textFormFieldDecoration(Icons.person, '', context),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, digite o usuário';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10.0,),
                    Text("Senha:", style: TextStyle(fontSize: 20.0, color: Theme.of(context).colorScheme.onPrimary)),
                    const SizedBox(height: 5.0,),
                    TextFormField(
                      decoration: CustomLayoutBuilder.textFormFieldDecoration(Icons.lock, '', context),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, digite a senha';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10.0,),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).colorScheme.secondary,
                            textStyle: Theme.of(context).textTheme.button,
                        ),
                        onPressed: (){
                          if (_loginFormKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Login efetuado com sucesso!')),
                            );
                            Navigator.push(context, MaterialPageRoute(builder: (context) => StorageList()));
                          }
                          else{
                            setState(() {});
                          }
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text("LOGAR"),
                        ),
                    ),
                    const SizedBox(height: 10.0,),
                    OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Theme.of(context).colorScheme.primary,
                          textStyle: Theme.of(context).textTheme.button,
                          side: BorderSide(
                            color: Theme.of(context).colorScheme.secondary,
                            width: 1.5
                          )
                        ),
                        onPressed: (){},
                        child: Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text("Registrar", style: TextStyle(color: Theme.of(context).colorScheme.secondary),),
                        ),
                    ),
                    const SizedBox(height: 10.0,),
                    TextButton(
                        style: TextButton.styleFrom(
                          textStyle: Theme.of(context).textTheme.button,
                        ),
                        onPressed: (){},
                        child: Text("Esqueci Minha Senha...", style: TextStyle(color: Theme.of(context).colorScheme.secondary, decoration: TextDecoration.underline))
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
