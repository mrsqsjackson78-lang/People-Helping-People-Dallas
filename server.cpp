
#include "crow.h"

int main() {
  crow::SimpleApp app;

  CROW_ROUTE(app, "/requests").methods("POST"_method)([]{
    return "Create request";
  });

  CROW_ROUTE(app, "/offers").methods("POST"_method)([]{
    return "Offer help";
  });

  app.port(18080).run();
}
