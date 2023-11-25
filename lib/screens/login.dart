import 'package:flutter/material.dart';

import 'package:prova_flutter/controller/alerts.dart';
import 'package:prova_flutter/screens/home.dart';
import 'package:prova_flutter/widgets/textShaker.dart';

import '../widgets/customTextField.dart';
import '../widgets/policyPrivacyButtom.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class login extends StatelessWidget  {
  const login({super.key});

  @override
  Widget build(BuildContext context) {
    
    final AlertStore _alertStore = AlertStore();
    
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(40),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xff1e4e62), Color(0xff2d958e)],
            ),
          ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            customTextField( //criado um widget customizado no intuito de reduzir o código.
                label: "Usuário",
                hintText: "",
                icon: Icons.person,
                onChanged: _alertStore.setUsuario,
                ),
            customTextField(
                label: "Senha",
                hintText: "",
                icon: Icons.lock,
                onChanged: _alertStore.setSenha,
                ),
            const SizedBox(height: 10,),
            Observer(builder: (_) => TextShaker(
              text: _alertStore.alertText,
              textColor: Colors.white,
            )), 
            
            Observer(builder: (_)=>Container(
                  margin: const EdgeInsets.only(top: 40),
              child: ElevatedButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  backgroundColor: MaterialStateProperty.all(const Color(0xff44bd6e)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                onPressed: () {
                  _alertStore.fieldCheckout().then((_) {
                    if (_alertStore.token) {
                      // Verifica se existe um token de acesso para poder acessar a próxima tela
                      // Acessa a próxima tela
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const home()));
                    }
                  });
                },
                child:Container(
                  padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
                  child: const Text(
                    "Entrar",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
),
        ]),
      ),
      extendBody: true,
      bottomNavigationBar: const policyPrivacyButtom() // criar widget customizado para reduzir código
    );
  }
}



