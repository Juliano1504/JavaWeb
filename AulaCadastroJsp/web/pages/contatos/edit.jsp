<%-- 
    Document   : create
    Created on : 18 de jan. de 2025, 14:57:04
    Author     : aluno
--%>

<%@page import="entidades.Contato"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Novo Contato</title>
         <%@ include file="../estilos.jsp" %>   
    </head>
    <body>
        <%
           String id = request.getParameter("id");
           Contato ct = new Contato();
           if(id != null){
              ct = daos.DaoContato.GetOne(Integer.parseInt(id));
           }             
        %>
        <header>
            <h1 class="text-center">Editando: <% out.print(ct.getNome()); %></h1>
        </header>
        <main class="container">
            <form action="./edit.jsp" method="POST">
                <input type="hidden" name="id" value=<% out.print(ct.getId()); %> />
                
                <label class="control-form">Informe nome</label>
                <input class="form-control" type="text" placeholder="Ex: ana" name="nome" value=<% out.print(ct.getNome()); %> />

                <label class="control-form">Informe email</label>
                <input class="form-control" type="email" placeholder="Ex: ana@gmail.com" name="email" value=<% out.print(ct.getEmail()); %> />

                <label class="control-form">Informe fone</label>
                <input class="form-control" type="tel" placeholder="Ex: (47)9999-9090" name="fone" value=<% out.print(ct.getFone()); %> />

                <div class="mt-3 d-flex justify-content-between">
                    <input type="submit" value="Salvar" class="btn btn-primary" />
                    <a href="./index.jsp" class="btn btn-secondary">Cancelar</a>
                </div>
            </form>
        </main>
        <%
            String nome = request.getParameter("nome");
            String email = request.getParameter("email");
            String fone = request.getParameter("fone");

            if (nome != null) {
                ct.setId(Integer.parseInt(request.getParameter(("id"))));
                ct.setNome(nome);
                ct.setEmail(email);
                ct.setFone(fone);
                try {
                    if (daos.DaoContato.Update(ct)) {
                        response.sendRedirect("./index.jsp");
                    }
                } catch (Exception e) {
                    //navegar pra página de erro
                }
            }

        %>
        <Footer>
            <%@ include file="../footer.jsp" %>
        </Footer>
    </body>
</html>
