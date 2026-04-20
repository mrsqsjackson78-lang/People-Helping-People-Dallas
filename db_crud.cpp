
#include <sqlite3.h>
#include <string>

void create_request(sqlite3* db, const std::string& desc) {
    std::string sql = "INSERT INTO requests(description) VALUES('"+desc+"');";
    sqlite3_exec(db, sql.c_str(), nullptr, nullptr, nullptr);
}
