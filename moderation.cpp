
bool detectAbuse(const std::string& text) {
    return text.find("threat") != std::string::npos;
}

void flagUser(int userId) {}
