import 'package:hive_flutter/adapters.dart';
part 'user_model.g.dart';

@HiveType(typeId: 1)
class UserModel {
  @HiveField(0)
  final String email;
  @HiveField(1)
  final String password;
  UserModel({
    required this.email,
    required this.password,
  });
}
