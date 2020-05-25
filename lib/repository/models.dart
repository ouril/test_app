import 'package:json_annotation/json_annotation.dart';

part 'models.g.dart';


@JsonSerializable()
class Geo {
  final String lat;
  final String lng;

  Geo({this.lat, this.lng});

  factory Geo.fromJson(Map<String, dynamic> json) => _$GeoFromJson(json);

  Map<String, dynamic> toJson() => _$GeoToJson(this);

}

@JsonSerializable()
class Address {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final Geo geo;

  Address({this.street, this.suite, this.city, this.zipcode, this.geo});

  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);


}



@JsonSerializable()
class Company {
  final String name;
  final String catchPhase;
  final String bs;

  Company({this.name, this.catchPhase, this.bs});

  factory Company.fromJson(Map<String, dynamic> json) => _$CompanyFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyToJson(this);
}


@JsonSerializable()
class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final Address address;

  User({this.id, this.name, this.username, this.email, this.address});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

}


@JsonSerializable()
class ToDo {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  ToDo({this.userId, this.id, this.title, this.completed});

  factory ToDo.fromJson(Map<String, dynamic> json) => _$ToDoFromJson(json);

  Map<String, dynamic> toJson() => _$ToDoToJson(this);

}

class UserList {
  List<User> userList;

  UserList.fromJson(List<dynamic> json){
    userList = json.map((e) => User.fromJson(e)).toList();
  }
}


class ToDoList {
  List<ToDo> todoList;

  ToDoList.fromJson(List<dynamic> json){
    todoList = json.map((e) => ToDo.fromJson(e)).toList();
  }
}