import '../models/user_model.dart';

class AuthService {
  static List<User> _users = [];

  // Signup
  static String signUp(User user) {
    // Check if email already exists
    for (var u in _users) {
      if (u.email == user.email) return "Email already registered!";
    }

    _users.add(user);
    return "Signup Successful!";
  }

  // Login
  static String login(String email, String password) {
    for (var u in _users) {
      if (u.email == email && u.password == password) {
        return "Login Successful!";
      }
    }
    return "Invalid email or password!";
  }

  // Optional: for debugging
  static List<User> getAllUsers() => _users;
}
