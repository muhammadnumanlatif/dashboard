import 'dart:convert';

class LoginModel {
  String? host;
  String? key;
  String? secret;

  LoginModel({
    this.host = 'Host Url',
    this.key = 'Consumer Key',
    this.secret = 'Consumer Secret',
  }); 

  LoginModel copyWith({
    String? host,
    String? key,
    String? secret,
  }) {
    return LoginModel(
      host: host ?? this.host,
      key: key ?? this.key,
      secret: secret ?? this.secret,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'host': host,
      'key': key,
      'secret': secret,
    };
  }

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(
      host: map['host'],
      key: map['key'],
      secret: map['secret'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginModel.fromJson(String source) =>
      LoginModel.fromMap(json.decode(source));

  @override
  String toString() => 'LoginModel(host: $host, key: $key, secret: $secret)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoginModel &&
        other.host == host &&
        other.key == key &&
        other.secret == secret;
  }

  @override
  int get hashCode => host.hashCode ^ key.hashCode ^ secret.hashCode;
}
