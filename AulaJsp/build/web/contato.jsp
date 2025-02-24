<%-- 
    Document   : contato.jsp
    Created on : 11 de jan. de 2025, 14:39:50
    Author     : aluno
--%>

<%@page import="entidades.Contato"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
          String nome = "Artur";
          out.print(nome);
        %>
        
        <%
           Contato contato = new Contato();
           contato.setId(1);
           contato.setNome("Juliano");
           contato.setEmail("juliano@gamil.com");
           contato.setFone("(47) 9087-0987");
           
          out.print("<p>"+contato.toString()+"</p>");
        %>
    </body>
</html>
