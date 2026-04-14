
#include "crow.h"

int main() {
    crow::SimpleApp app;

    CROW_ROUTE(app, "/health")([]{ return "OK"; });

    // Requests
    CROW_ROUTE(app, "/requests").methods("GET"_method)([]{ return "List requests"; });
    CROW_ROUTE(app, "/requests").methods("POST"_method)([]{ return "Create request"; });
    CROW_ROUTE(app, "/requests/<int>").methods("PUT"_method)([](int){ return "Update request"; });
    CROW_ROUTE(app, "/requests/<int>").methods("DELETE"_method)([](int){ return "Delete request"; });

    // Offers
    CROW_ROUTE(app, "/offers").methods("POST"_method)([]{ return "Create offer"; });

    // Messaging
    CROW_ROUTE(app, "/messages").methods("POST"_method)([]{ return "Send message"; });

    app.port(18080).run();
}
