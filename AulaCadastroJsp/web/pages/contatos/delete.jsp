<%-- 
    Document   : excluir
    Created on : 18 de jan. de 2025, 17:12:47
    Author     : aluno
--%>

<%@page import="entidades.Contato"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@ include file="../estilos.jsp" %>
        <style>
            main > p{
                font-weight: bold;
            }

            span{
                padding-left: 10px;
                font-weight: 100;
            }
        </style>
    </head>
    <body>
        <%
            String id = request.getParameter("id");
            Contato ct = new Contato();
            if (id != null) {
                ct = daos.DaoContato.GetOne(Integer.parseInt(id));
            }
        %>
        <header>
            <h1 class="text-center">Excluir</h1>
        </header>
        <main class="container">
            <form action="./delete.jsp" class="mt-4">
                <input type="hidden" name="id-excluir" value=<% out.print(ct.getId()); %> />
                <p>Nome:<span><%out.print(ct.getNome());%></span></p>
                <p>Email:<span><%out.print(ct.getEmail());%></span></p>
                <p>Fone:<span><%out.print(ct.getFone());%></span></p>

                <input type="submit" value="Delete" class="btn btn-danger" />
                <a href="./index.jsp" class="btn btn-success">Voltar</a>                
            </form>
        </main>
        <%
            id = request.getParameter("id-excluir");
            if (id != null) {
                daos.DaoContato.Delete(Integer.parseInt(id));
                response.sendRedirect(("./index.jsp"));
            }
        %>
        <Footer>
            <%@ include file="../footer.jsp" %>
        </Footer>
    </body>
</html>
