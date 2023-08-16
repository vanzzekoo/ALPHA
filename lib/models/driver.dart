class Driver {
  int id;
  String name;
  String ktp;
  String password;

  Driver({
    required this.id,
    required this.name,
    this.ktp = '',
    this.password = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'ktp': ktp,
      'password': password,
    };
  }

  factory Driver.fromMap(Map<String, dynamic> map) {
    return Driver(
      id: map['id'],
      name: map['name'],
      ktp: map['ktp'],
      password: map['password'],
    );
  }
}
