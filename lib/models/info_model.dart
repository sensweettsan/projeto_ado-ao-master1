class InfoModel {
  int id;
  String username;
  String nome;
  String imagem;
  String especie;
  String descricao;
  String email;
  String contato;

  InfoModel(
    this.id,
    this.username,
    this.nome,
    this.imagem,
    this.especie,
    this.descricao,
    this.email,
    this.contato,
  );

  factory InfoModel.fromJson(dynamic json) {
    return InfoModel(
      json['id'] as int,
      json['attributes']['users_permissions_user']['data']['attributes']
          ['username'] as String,
      json['attributes']['nome'] as String,
      json['attributes']['img']['data']['attributes']['formats']['thumbnail']
          ['url'] as String,
      json['attributes']['especie'] as String,
      json['attributes']['descricao'] as String,
      json['attributes']['users_permissions_user']['data']['attributes']
          ['email'] as String,
      json['attributes']['users_permissions_user']['data']['attributes']
          ['contato'] as String,
    );
  }
}
