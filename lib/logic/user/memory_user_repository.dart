import 'package:app/logic/user/user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return MemoryUserRepository();
});

class MemoryUserRepository implements UserRepository {
  String _name = '';
  @override
  Future<String> getName() async {
    await Future.delayed(const Duration(seconds: 1));
    return _name;
  }

  @override
  Future<void> setName(String name) async {
    await Future.delayed(const Duration(seconds: 1));
    _name = name;
  }
}
