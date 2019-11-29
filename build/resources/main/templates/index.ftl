<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>${titulo}</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/blog-home.css" rel="stylesheet">
    <style>
        @media screen and (max-width:480px){
            body {
                font-size:80%;
            }
        }
        .editBtn{
            background-color: #ecd1f9;
            color: #ff7500;
            padding: 5px 5px;
            margin: 10px 0 ;
            border: none;
            cursor: pointer;
            width: 10%;
            border-radius: 5px;
        }
        a.editBtn:hover{
            text-decoration: none;
            opacity: 0.9;
            background-color: #ed992f;
            color:white;
        }
    </style>
</head>

<body>

<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-2">
        <a class="navbar-brand" href="/">Blog Programacion Web</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="/">Inicio
                        <span class="sr-only">(current)</span>
                    </a>
                </li>
                <#if logUser??>
                    <#if logUser.administrador || logUser.autor>
                        <li class="nav-item">
                            <a class="nav-link" href="/publicarArticulo">Nuevo Articulo</a>
                        </li>
                    </#if>
                </#if>

                <#if logUser??>
                    <#if logUser.administrador>
                        <li class="nav-item">
                            <a class="nav-link" href="/listaUsuarios">Gestion de Usuarios</a>
                        </li>
                    </#if>
                </#if>
                <#if logUser??>
                    <li class="nav-item">
                        <a class="nav-link" href="/logout">Logout</a>
                    </li>
                <#else>
                    <li class="nav-item">
                        <a class="nav-link" href="/iniciarSesion">Login</a>
                    </li>
                </#if>
            </ul>
        </div>
</nav>

<!-- Page Content -->
<div class="container mt-4">

    <div class="row">

        <!-- Blog Entries Column -->
        <div class="col-md-8">

            <h1 class="my-4">Articulos
                <small>Publicaciones Recientes</small>
            </h1>

            <!-- Blog Post -->
            <#list articulos as articulo>
                <div class="card mb-4">
                    <div class="card-body">
                        <#if logUser??>
                            <#if logUser.administrador || logUser.autor>
                                <a href="/editarArticulo/${articulo.id}" class="editBtn">Editar</a>
                                <br>
                                <br>
                            </#if>
                        </#if>
                        <h2 class="card-title">${articulo.titulo}</h2>
                        <p class="card-text">
                            ${articulo.textoResumido()}
                        </p>
                        <a href="/leerArticuloCompleto/${articulo.id}" class="btn btn-primary">Seguir Leyendo &rarr;</a>
                    </div>
                    <div class="card-footer text-muted">
                        Subido en ${articulo.fecha} por
                        <a href="#">${articulo.autor.nombre}</a>
                    </div>
                </div>
            </#list>

            <!-- Pagination -->
            <ul class="pagination justify-content-center mb-4">
                <li class="page-item">
                    <a class="page-link" href="#">&larr; Reciente</a>
                </li>
                <li class="page-item disabled">
                    <a class="page-link" href="#">Antiguo &rarr;</a>
                </li>
            </ul>

        </div>

        <!-- Sidebar Widgets Column -->
        <div class="col-md-4">

            <!-- Categories Widget -->
            <div class="card my-4">
                <h5 class="card-header">Tags</h5>
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-6">
                            <ul class="list-unstyled mb-0">
                                <#list tagsCol1 as t1>
                                    <li>
                                        <a href="#">${t1}</a>
                                    </li>
                                </#list>
                            </ul>
                        </div>
                        <div class="col-lg-6">
                            <ul class="list-unstyled mb-0">
                                <#list tagsCol2 as t2>
                                    <li>
                                        <a href="#">${t2}</a>
                                    </li>
                                </#list>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </div>
    <!-- /.row -->

</div>
<!-- /.container -->

<!-- Footer -->
<footer class="py-5 bg-dark">
    <div class="container">
        <p class="m-0 text-center text-white">Blog Tarea 3, Programacion web</p>
    </div>
    <!-- /.container -->
</footer>

<!-- Bootstrap core JavaScript -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>