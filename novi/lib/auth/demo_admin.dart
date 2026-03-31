/// Credenciales de administrador de demostración (solo en el cliente).
/// Sustituir por autenticación real (API, Firebase, etc.).
abstract final class DemoAdmin {
  static const email = 'admin@novi.app';
  static const password = 'admin123';

  static bool validate(String emailInput, String passwordInput) {
    return emailInput.trim().toLowerCase() == email &&
        passwordInput == password;
  }
}
