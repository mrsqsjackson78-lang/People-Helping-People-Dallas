
#include <bcrypt/BCrypt.hpp>
#include <jwt-cpp/jwt.h>

std::string hashPassword(const std::string& password) {
  return BCrypt::generateHash(password);
}
