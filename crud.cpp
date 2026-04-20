
#include "crow.h"
crow::response ok(const std::string& m){ return crow::response(200,m);} 

void run_api(){ crow::SimpleApp app;
 CROW_ROUTE(app,"/requests").methods("GET"_method) ([] { return ok("List requests"); });
 CROW_ROUTE(app,"/requests").methods("POST"_method) ([] { return ok("Create request"); });
 CROW_ROUTE(app,"/requests/<int>").methods("PUT"_method) ([](int){ return ok("Update request"); });
 CROW_ROUTE(app,"/requests/<int>").methods("DELETE"_method) ([](int){ return ok("Delete request"); });
 app.port(18080).run(); }

int main(){ run_api(); }
