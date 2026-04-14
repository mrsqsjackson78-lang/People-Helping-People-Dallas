
#include <bcrypt/BCrypt.hpp>
#include <jwt-cpp/jwt.h>

std::string hashPassword(const std::string& pw) {
    return BCrypt::generateHash(pw);
}
