import 'dart:convert';

//  //

class Person {
  final int id;
  final String name;
  final String email;

  const Person({
    required this.id,
    required this.name,
    required this.email,
  });

  Person copyWith({
    int? id,
    String? name,
    String? email,
  }) {
    return Person(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }

  factory Person.fromMap(Map<String, dynamic> map) {
    return Person(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      email: map['email'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Person.fromJson(String source) => Person.fromMap(json.decode(source));

  @override
  String toString() => 'Person(id: $id, name: $name, email: $email)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Person &&
        other.id == id &&
        other.name == name &&
        other.email == email;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ email.hashCode;
}






// class Person {
//   final int id;
//   final String name;
//   final String email;

//   const Person({
//     required this.id,
//     required this.name,
//     required this.email,
//   });

//   @override
//   String toString() => 'Person(id: $id, name: $name, email: $email)';

//   Person copyWith({
//     int? id,
//     String? name,
//     String? email,
//   }) {
//     return Person(
//       id: id ?? this.id,
//       name: name ?? this.name,
//       email: email ?? this.email,
//     );
//   }

//   @override
//   bool operator ==(covariant Person other) {
//     if (identical(this, other)) return true;

//     return other.id == id && other.name == name && other.email == email;
//   }

//   @override
//   int get hashCode => id.hashCode ^ name.hashCode ^ email.hashCode;

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'id': id,
//       'name': name,
//       'email': email,
//     };
//   }

//   factory Person.fromMap(Map<String, dynamic> map) {
//     return Person(
//       id: map['id'] as int,
//       name: map['name'] as String,
//       email: map['email'] as String,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory Person.fromJson(String source) =>
//       Person.fromMap(json.decode(source) as Map<String, dynamic>);
// }
