<%-- 
    Document   : index
    Created on : 18 de jan. de 2025, 13:47:11
    Author     : aluno
--%>

<%@page import="java.util.List"%>
<%@page import="entidades.Contato"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Contatos</title>
         <%@ include file="../estilos.jsp" %>
    </head>
    <body>
        <header>
            <h1>Contatos</h1>
        <%@ include file="../menu.jsp" %>
        </header>
        <main>
            <a class="btn btn-primary" href='./create.jsp'>Novo</a>
            <table class="table table-striped">
                <Thead>
                    <tr>
                        <th>Nome</th>
                        <th>Email</th>
                        <th>Fone</th>
                        <th></th>
                        <th></th>
                    </tr>
                </Thead>
                <tbody>
                    <!-- preencher com dados do banco de dados -->
                    <%
                       List<Contato> lista = daos.DaoContato.GetAll();
                       for (Contato elem : lista) {
                           out.print("<tr>"); 
                           out.print("<td>"+elem.getNome()+"</td>"); 
                           out.print("<td>"+elem.getEmail()+"</td>");
                           out.print("<td>"+elem.getFone()+"</td>");
                           out.print("<td><a href='./edit.jsp?id=" + elem.getId() + "'>Editar</a></td>");
                           out.print("<td><a href='./delete.jsp?id=" + elem.getId() + "'>Excluir</a></td>");
                          out.print("</tr>"); 
                        }
                    %>
                </tbody>
            </table>
        </main>
        <Footer>
            <%@ include file="../footer.jsp" %>
        </Footer>
    </body>
</html>
