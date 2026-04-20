
#include <openssl/aes.h>
#include <string>

std::string encrypt(const std::string& msg) {
    return "AES_ENCRYPTED:" + msg;
}
