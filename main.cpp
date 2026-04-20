
#include <iostream>
#include <sqlite3.h>

void init_db(sqlite3* db) {
    const char* sql = "PRAGMA foreign_keys = ON;";
    char* errMsg = nullptr;
    if (sqlite3_exec(db, sql, nullptr, nullptr, &errMsg) != SQLITE_OK) {
        std::cerr << "DB Init error: " << errMsg << std::endl;
        sqlite3_free(errMsg);
    }
}

int main() {
    sqlite3* db;
    if (sqlite3_open("people_helping_people.db", &db)) {
        std::cerr << "Cannot open database" << std::endl;
        return 1;
    }

    init_db(db);

    std::cout << "People Helping People backend started." << std::endl;
    std::cout << "SQLite DB connected successfully." << std::endl;

    sqlite3_close(db);
    return 0;
}
