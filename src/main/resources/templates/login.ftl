<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<head>
    <title>${titulo}</title>
    <style>
        html{
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
            background-image: url("https://firebasestorage.googleapis.com/v0/b/images-846ef.appspot.com/o/wallpaperflare.com_wallpaper.jpg?alt=media&token=55f5b8a2-8f19-4492-a067-e58cb08d429a");
            background-size: cover;
            background-repeat: no-repeat;
            height: 100%;


        }
        @media screen and (max-width:480px){
            body {
                font-size: 90%;

            }
        }

        /*Títulos de la página de login*/
        .titulo{
            background-color: #13d184;
            padding: 10px;
            height: 50%;
            width: 100%;
            /*margin: auto;*/

            opacity: 80%;
        }
        .titulo2{

            text-align: center;
            padding: 10px;
            height: 20%;
            width: 100%;
            margin: auto;
            color: #ffffff;
        }
        /*Contenido del formulario de login*/
        .loginContainer {
            padding: 50px;
            height: 30%;
            width: 30%;
            margin: auto;
        }
        /*Campos del formulario*/
        input[type=text], input[type=password] {
            width: 100%;
            padding: 12px 20px;
            margin: 10px 0;
            display: inline-block;
            border: 1px solid #a5ccc2;
            box-sizing: border-box;
        }
        /*Botón de registrar*/
        button {
            background-color: #6dff6c;
            color: #fff;
            padding: 12px 12px;
            margin: 10px 0 ;
            border: none;
            cursor: pointer;
            width: 100%;
        }
        button:hover {
            opacity: 90%;
            color: whitesmoke;
        }

    </style>
</head>
<body>

<div class="titulo">


</div>
<div class="titulo2">
    <h1>Mi Primer Blog</h1>
    <h3> Iniciar sesion</h3>
</div>

<form action="/procesarUsuario" method="post">
    <div class="loginContainer">
        <label style="color: white; font-size: 22px"><b>Usuario</b></label>
        <input type="text" name="username" placeholder="Usuario" required>

        <label style="color: white; font-size: 22px"><b>Clave</b></label>
        <input type="password" name="password" placeholder="Clave"  required>

        <button type="submit">Entrar</button>
        <label style="color: white; font-size: 22px">
            <input type="checkbox" name="recordar"> Recordar
        </label>
    </div>
</form>
</body>
</html>