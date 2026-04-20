
#include <bcrypt/BCrypt.hpp>
#include <jwt-cpp/jwt.h>
std::string hash(const std::string&p){ return BCrypt::generateHash(p);} 
