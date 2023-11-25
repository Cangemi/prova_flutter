import 'package:mobx/mobx.dart';
import 'package:prova_flutter/models/usuario.dart';
import 'package:prova_flutter/services/requests.dart';


part 'alerts.g.dart';

class AlertStore = _AlertStore with _$AlertStore;

abstract class _AlertStore with Store {

  @observable
  String alertText = "";
  @observable
  bool token = false;
  @observable
  String usuario = "";
  @observable
  String senha = "";

  @action
  void setUsuario(value) => usuario = value;
  @action
  void setSenha(value) => senha = value;

  @action
  fieldCheckout()async{ // função para realizar as validações
    if(usuario.isEmpty && senha.isEmpty){
      alertText = "Preencha os campos acima!";
    }else if(usuario.isEmpty){
      alertText = "Preencha o campo usuário!";
    }else if (senha.isEmpty){
      alertText = "Preencha o campo senha!";    
    }else if (senha.length < 2){
      alertText = "A senha não pode conter menos de 2 caracteres"; 
    }else if (usuario.startsWith(" ")|| usuario.endsWith(" ")){
      alertText = "O usuário não pode iniciar com espaços vazios ou terminar com espaços vazios"; 
    }else{
      userRequests _request = userRequests();

      List<dynamic> user = await _request.getUser();

      for (Users u in user){
        if(u.usuario == usuario && u.senha == senha){ // o correto seria realizar esta validação na Api e retornar um token
          token = true; // quando houver valor no token, liberar o acesso para a home screen
        }
      }
      if(!token){
        alertText = "Usuário ou Senha inválidos"; 
      }
    }
  }
}