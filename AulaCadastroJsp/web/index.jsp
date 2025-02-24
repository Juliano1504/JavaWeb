<%-- 
    Document   : index
    Created on : 18 de jan. de 2025, 13:42:40
    Author     : aluno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" 
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    </head>
    <body>
        <div class="container">
            <h1>Home</h1>
            <nav class="navbar-nav">
                <ul class="navbar-nav d-flex">
                    <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
                    <li><a class="nav-link" href="pages/contatos/index.jsp">Contatos</a></li>
                </ul>               
                <a class="nav-link" href="pages/enderecos/index.jsp">Endereços</a>
                <a class="nav-link" href="pages/compromissos/index.jsp">Compromissos</a>
            </nav>
        </div>
    </body>
</html>
