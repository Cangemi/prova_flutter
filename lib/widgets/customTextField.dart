import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class customTextField extends StatelessWidget {
  const customTextField({
    super.key,
    //required this.controller,
    this.icon,
    this.label,
    this.hintText, 
    this.onSubmitted,
    required this.onChanged,
  });

  //final TextEditingController controller;
  final IconData? icon;
  final String? label;
  final String? hintText;
  final Function onChanged;
  final Function? onSubmitted;

  @override
  Widget build(BuildContext context) {
    final FocusNode _focusNode = FocusNode();
    TextEditingController _controller = TextEditingController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label != null?Container(
          padding: const EdgeInsets.only(top: 10,bottom: 5,left: 15),
          child: Text(label!,
          style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w200
              ),
            ),
        )
        :Container(),
          Container(
            padding: const EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5)
              ),
            child: Row(
              children: [
                icon != null? Icon(icon): Container(),
                const SizedBox(width: 5,),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    autofocus: true,
                    focusNode: _focusNode,
                    inputFormatters: label != null? []:label == 'Senha'?[
                      FilteringTextInputFormatter.allow(
                        RegExp(r'[a-zA-Z0-9]'), // Permite apenas caracteres de 'a' a 'z' e de '0' a '9'
                      ),
                    ]
                    :[],
                    maxLength: 20, // limita campo de texto para no máximo 20 caracteres
                    keyboardType: label != null? TextInputType.none :label == 'Usuário'?TextInputType.emailAddress : TextInputType.none ,
                    decoration: InputDecoration(
                      hintTextDirection: TextDirection.ltr,
                      hintText: hintText ?? "",
                      hintStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        
                      ),
                      counterText: '',
                      border: InputBorder.none
                    ),
                    onChanged: (value){
                      onChanged(value);
                    },
                    // permite que faça uma ação quando o enter for pressionado
                    onSubmitted: (value){
                      if(label==null){
                        FocusScope.of(context).requestFocus(_focusNode);
                        if(value.isNotEmpty){
                          onSubmitted!();
                          _controller.clear();                          
                        }
                      }
                    },
                  ),
                )
              ],
            ),  
        )
      ],
    );
  }
}