// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Geo _$GeoFromJson(Map<String, dynamic> json) {
  return Geo(
    lat: json['lat'] as String,
    lng: json['lng'] as String,
  );
}

Map<String, dynamic> _$GeoToJson(Geo instance) => <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

Address _$AddressFromJson(Map<String, dynamic> json) {
  return Address(
    street: json['street'] as String,
    suite: json['suite'] as String,
    city: json['city'] as String,
    zipcode: json['zipcode'] as String,
    geo: json['geo'] == null
        ? null
        : Geo.fromJson(json['geo'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'street': instance.street,
      'suite': instance.suite,
      'city': instance.city,
      'zipcode': instance.zipcode,
      'geo': instance.geo,
    };

Company _$CompanyFromJson(Map<String, dynamic> json) {
  return Company(
    name: json['name'] as String,
    catchPhase: json['catchPhase'] as String,
    bs: json['bs'] as String,
  );
}

Map<String, dynamic> _$CompanyToJson(Company instance) => <String, dynamic>{
      'name': instance.name,
      'catchPhase': instance.catchPhase,
      'bs': instance.bs,
    };

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    id: json['id'] as int,
    name: json['name'] as String,
    username: json['username'] as String,
    email: json['email'] as String,
    address: json['address'] == null
        ? null
        : Address.fromJson(json['address'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'email': instance.email,
      'address': instance.address,
    };

ToDo _$ToDoFromJson(Map<String, dynamic> json) {
  return ToDo(
    userId: json['userId'] as int,
    id: json['id'] as int,
    title: json['title'] as String,
    completed: json['completed'] as bool,
  );
}

Map<String, dynamic> _$ToDoToJson(ToDo instance) => <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
      'completed': instance.completed,
    };
