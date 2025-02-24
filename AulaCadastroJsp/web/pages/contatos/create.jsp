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
        <header>
            <h1 class="text-center">Novo Contato</h1>
        </header>
        <main class="container">
            <form action="./create.jsp" method="POST">
                <label class="control-form">Informe nome</label>
                <input class="form-control" type="text" placeholder="Ex: ana" name="nome" />

                <label class="control-form">Informe email</label>
                <input class="form-control" type="email" placeholder="Ex: ana@gmail.com" name="email" />

                <label class="control-form">Informe fone</label>
                <input class="form-control" type="tel" placeholder="Ex: (47)9999-9090" name="fone" />

                <div class="mt-3 d-flex justify-content-between">
                    <input type="submit" value="Salvar" class="btn btn-primary" />
                    <input type="reset" value="Cancelar" class="btn btn-secondary" />
                </div>
            </form>
        </main>
        <%
            String nome = request.getParameter("nome");
            String email = request.getParameter("email");
            String fone = request.getParameter("fone");

            if (nome != null) {
                Contato ct = new Contato();
                ct.setNome(nome);
                ct.setEmail(email);
                ct.setFone(fone);
                //gravar no banco de dados

                try {

                    if (daos.DaoContato.Create(ct)) {
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
