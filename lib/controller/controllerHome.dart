import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';


part 'controllerHome.g.dart';

class ControllerHome = _ControllerHome with _$ControllerHome;


abstract class _ControllerHome with Store {

ObservableList<String> list = ObservableList();
static const String key = 'observableListKey';

  @observable
  String novoValor = "";
  @observable
  String alertText = "";

  @action
  void setNovoValor(value) => novoValor = value;

  @action
  void setSavedList(value) => list = ObservableList<String>.of(value);

  @action
  setList() async{
    if(novoValor.isNotEmpty){
      list.add(novoValor);
      alertText = "";
    }else if (novoValor == ""){
      alertText = "Camnpo vazio!";
    }
    saveList();
    novoValor = '';
  }

  @action
  void delete(int index){ 
    list.removeAt(index);
    saveList();
    }

  @action
  void update(int index){
    if(novoValor.isNotEmpty){
      list[index] = novoValor;
      saveList();
    }else if (novoValor == ""){
      alertText = "Campo vazio!";
    }
  }

    Future<void> saveList() async { // salva a lista
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String jsonList = json.encode(list.toList());
    await prefs.setString(key, jsonList);
  }

  Future<void> loadList() async { // carrega a lista salva
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? jsonList = prefs.getString(key);

    if (jsonList != null) {
      final List<dynamic> decodedList = json.decode(jsonList);
      list.clear();
      list.addAll(decodedList.cast<String>());
    }
  }


}
