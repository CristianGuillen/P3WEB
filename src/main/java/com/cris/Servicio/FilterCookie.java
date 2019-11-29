package com.cris.Servicio;

import com.cris.clases.Usuario;

import static spark.Spark.*;//importacion estatica.. nos da acceso a todos los metodos post, get,
// Dentro del constructor, el método get () se usa para registrar una Ruta que escucha las solicitudes GET en / usuarios.

public class FilterCookie {
    public void aplicarFiltros(){


        after((request, response) -> {
            response.header("foo", "set by after filter");
        });

        afterAfter((request, response) -> {
            response.header("foo", "set by afterAfter filter");
        });

        before("/gestionarUsuarios", (request, response) -> {
            // ... check if authenticated
            Usuario logUser = request.session(true).attribute("usuario");
            if (logUser == null || !logUser.isAdministrador()) {
                halt(401, "Error:Error:no tienes permisos para acceder aqui");
            }
        });

        before("/listaUsuarios", (request, response) -> {
            // ... check if authenticated
            Usuario logUser = request.session(true).attribute("usuario");
            if (logUser == null || !logUser.isAdministrador()) {
                halt(401, "Error:Error:no tienes permisos para acceder aqui!");
            }
        });

        before("/visualizarUsuario/*", (request, response) -> {
            // ... check if authenticated
            Usuario logUser = request.session(true).attribute("usuario");
            if (logUser == null || !logUser.isAdministrador()) {
                halt(401, "Error: Error:no tienes permisos para acceder aqui!");
            }
        });

        before("/editarUsuario/*", (request, response) -> {
            // ... check if authenticated
            Usuario logUser = request.session(true).attribute("usuario");
            if (logUser == null || !logUser.isAdministrador()) {
                halt(401, "Error:no tienes permisos para acceder aqui!");
            }
        });

        before("/eliminarUsuario/*", (request, response) -> {
            // ... check if authenticated
            Usuario logUser = request.session(true).attribute("usuario");
            if (logUser == null || !logUser.isAdministrador()) {
                halt(401, "Error:no tienes permisos para acceder aqui!");
            }
        });

        before("/publicarArticulo", (request, response) -> {
            // ... check if authenticated
            Usuario logUser = request.session(true).attribute("usuario");
            if (logUser == null || (!logUser.isAdministrador() && !logUser.isAutor())) {
                halt(401, "Error:no tienes permisos para acceder aqui");
            }
        });


        after("/", (request, response) -> {
            // ... check if authenticated
            Usuario logUser = request.session(true).attribute("usuario");
            if (logUser == null || (!logUser.isAdministrador() && !logUser.isAutor())) {
                response.redirect("/iniciarSesion");
            }
        });
    }
}
