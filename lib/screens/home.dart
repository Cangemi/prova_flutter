import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:prova_flutter/widgets/customTextField.dart';
import '../controller/controllerHome.dart';
import '../widgets/policyPrivacyButtom.dart';
import '../widgets/textShaker.dart';


class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {

  final ControllerHome _controllerHome = ControllerHome();

  void getSavedList()async{
    await _controllerHome.loadList();
  }

  _alertDialog(int index){
    return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Confirmação de Exclusão'),
        content: const SingleChildScrollView(
          child: Text('Deseja excluir o item?'),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); 
            },
            child: const Text(
              'Cancelar',
              style: TextStyle(color: Colors.red),
            ),
          ),
          TextButton(
            onPressed: () {
              _controllerHome.delete(index);
              Navigator.of(context).pop(); 
            },
            child: const Text(
              'Sim',
              style: TextStyle(color: Colors.green),
            ),
          ),
        ],
      );
    },
  );
  }

  _editText(int index){
    return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Editar Texto'),
        content: SingleChildScrollView(
          child:ListBody(
            children: [
              customTextField(
                label: " ",
                hintText: "Insira um novo texto",
                onChanged: _controllerHome.setNovoValor,
                ),
              Observer(builder: (_) => TextShaker(
                text: _controllerHome.alertText,
                textColor: Colors.red,
              ))
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); 
            },
            child: const Text(
              'Cancelar',
              style: TextStyle(color: Colors.red),
            ),
          ),
          TextButton(
            onPressed: () {
              _controllerHome.update(index);
              if(_controllerHome.novoValor.isNotEmpty){
                Navigator.of(context).pop();
              } 
            },
            child: const Text(
              'Confirmar',
              style: TextStyle(color: Colors.green),
            ),
          ),
        ],
      );
    },
  );
  }
  getSavedList();
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
        child: Container(
          padding: const EdgeInsets.only(left: 40,right: 40),
          child: Column(
            children: [
              SizedBox(
                height: 300,
                child: Card(
                  child: Observer(builder: (_)=>ListView.separated(
                    itemCount: _controllerHome.list.length,
                    itemBuilder: (context, index){
                      return ListTile(
                        title: 
                        Text(
                          _controllerHome.list[index],
                          textAlign: TextAlign.center,
                          ),
                          trailing: SizedBox(
                            width: 80,
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: (){
                                    _editText(index);
                                  }, 
                                  icon: const Icon(Icons.mode_edit)),
                                IconButton(
                                  onPressed: (){
                                    _alertDialog(index);
                                  },
                                  //=>_controllerHome.delete(index), 
                                  icon: const Icon(Icons.cancel,
                                  color: Colors.red,)),
                              ],
                            ),
                          ),
                
                      );
                    }, 
                    separatorBuilder:  (context, index) {
                        // Construa aqui o widget do separador
                        return const Divider(
                          color: Colors.grey,
                          thickness: 2.0,
                        );
                      }, 
                    )),
                ),
              ),
              const SizedBox(height: 30,),
              customTextField(
                hintText: "Digite seu texto",
                onChanged: _controllerHome.setNovoValor,
                onSubmitted: _controllerHome.setList,
                ),
              Observer(builder: (_) => TextShaker(
                text: _controllerHome.alertText,
                textColor: Colors.white,
              )), 
            ]
            ),
        ),
      ),
      extendBody: true,
      bottomNavigationBar: const policyPrivacyButtom() // criado widget customizado para reduzir código
    );
  }
}