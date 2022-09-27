abstract class UserRepository {
  Future<String> getName();

  Future<void> setName(String name);
}
