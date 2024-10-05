// models/user_management.dart

class UserManagement {
  static final Map<String, String> _users = {}; // Menyimpan pengguna (email: password)

  // Metode untuk mendaftarkan pengguna
  static void registerUser(String email, String password) {
    _users[email] = password;
  }

  // Metode untuk memeriksa apakah pengguna terdaftar
  static bool isUserRegistered(String email, String password) {
    return _users.containsKey(email) && _users[email] == password;
  }
}
