class Users {
  String? id;
  String usuario;
  String senha;// não é uma boa prática, este caso é somente para prova

  Users({
    this.id,
    required this.usuario,
    required this.senha,
  });

  factory Users.fromJson(Map<String, dynamic> map) {
    return Users(
      id: map['id'],
      usuario: map['name'],
      senha: map['pass'],
    );
  }
}
