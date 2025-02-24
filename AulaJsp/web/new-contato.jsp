<%-- 
    Document   : new-contato.jsp
    Created on : 11 de jan. de 2025, 15:19:16
    Author     : aluno
--%>

<%@page import="java.util.List"%>
<%@page import="entidades.ContatoDao"%>
<%@page import="entidades.Contato"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
              rel="stylesheet" 
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
              crossorigin="anonymous">
    </head>
    <body>
        <h1 class="text-center">Hello World!</h1>
        <form method="POST" action="new-contato.jsp" class="container">
            <label class="control-form">Informe nome</label>
            <input class="form-control" type="text" placeholder="Informe nome" name="nome"/>
            
            <label class="control-form">Informe email</label>
            <input class="form-control" type="text" placeholder="Informe email" name="email"/>
            
            <label class="control-form">Informe fone</label>
            <input class="form-control" type="text" placeholder="Informe fone" name="fone"/>
            
            <input type="submit" value="Gravar" class="btn btn-primary mt-3" />
        </form>
        <%
           Contato contato = new Contato();
           String nome = request.getParameter("nome");
           
           contato.setNome(nome);
           contato.setEmail(request.getParameter("email"));
           contato.setFone(request.getParameter("fone"));   
           
           ContatoDao.inserir(contato);
        %>
        <p>
        <table class="table">
            <thead>
                <tr>
                    <th>Nome</th>
                    <th>Email</th>
                    <th>Fone</th>
                </tr>
            </thead>
            <tbody>
                <%
                  List<Contato> listaContato = ContatoDao.getContatos();
                  for (Contato item : listaContato) {
                     out.print("<tr>");
                     out.print("<td>"+ item.getNome() +"</td>");
                     out.print("<td>"+ item.getEmail()+"</td>");
                     out.print("<td>"+ item.getFone()+"</td>");
                     out.print("</tr>");
                  }
                %>
            </tbody>
        </table>
        </p>
    </body>
</html>
