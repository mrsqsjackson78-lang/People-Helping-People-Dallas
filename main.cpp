
// Simplified Crow API with SQLite & JWT placeholders
#include <crow.h>
#include <sqlite3.h>
#include <iostream>

int main() {
  crow::SimpleApp app;

  CROW_ROUTE(app, "/api/health")([]{
    return "OK";
  });

  app.port(18080).run();
}
