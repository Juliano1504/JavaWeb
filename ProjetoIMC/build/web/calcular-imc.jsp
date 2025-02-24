<%-- 
    Document   : calcuclar-imc
    Created on : 11 de jan. de 2025, 16:33:28
    Author     : aluno
--%>

<%@page import="entitdades.Imc"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    </head>
    <body>
        <div class="container">
            <h1>Cálculo IMC</h1>
            <p>

                IMC é a sigla para Índice de Massa Corpórea, parâmetro adotado pela Organização Mundial de Saúde para calcular o peso ideal de cada pessoa.

                O índice é calculado da seguinte maneira: divide-se o peso do paciente pela sua altura elevada ao quadrado. Diz-se que o indivíduo tem peso normal quando o resultado do IMC está entre 18,5 e 24,9.

                Quer descobrir seu IMC? Insira seu peso e sua altura nos campos abaixo e compare com os índices da tabela. Importante: siga os exemplos e use pontos como separadores.
            </p>
            <form method="POST" action="calcular-imc.jsp">
                <label class="control-form">Altura</label>
                <input class="form-control" type="text" name="altura" placeholder="ex: 1.58"/>

                <label class="control-form">Peso</label>
                <input class="form-control" type="text" name="peso" placeholder="ex: 95"/>

                <input type="submit" value="Calcular" class="btn btn-primary mt-3"/>

            </form>
            <table class="table" cellspacing="0">
                <thead class="text-red">
                    <tr>
                        <td colspan="3" class="text-primary">Veja a interpretação do IMC</td>
                    </tr>
                </thead>

                <tbody>						
                    <tr>
                        <td>IMC</td>
                        <td>Classificação</td>
                        <td style="text-align: center">Obesidade <small>(grau)</small></td>
                    </tr>

                    <tr>
                        <td>Menor que 18,5</td>
                        <td>Magreza</td>
                        <td style="text-align: center">0</td>
                    </tr>

                    <tr>
                        <td>Entre 18,5 e 24,9</td>
                        <td>Normal</td>
                        <td style="text-align: center">0</td>
                    </tr>

                    <tr>
                        <td>Entre 25,0 e 29,9</td>
                        <td>Sobrepeso</td>
                        <td style="text-align: center">I</td>
                    </tr>

                    <tr>
                        <td>Entre 30,0 e 39,9</td>
                        <td>Obesidade</td>
                        <td style="text-align: center">II</td>
                    </tr>

                    <tr>
                        <td>Maior que 40,0</td>
                        <td>Obesidade Grave</td>
                        <td style="text-align: center">III</td>
                    </tr>
                </tbody>
            </table>
            <%
                Imc imc = new Imc();
                String altura = request.getParameter("altura");
                
                if (altura != null)
                    imc.setAltura(Float.parseFloat(altura));
                 
                String peso = request.getParameter("peso");
                if(peso != null)
                   imc.setPeso(Float.parseFloat(peso));
            %>
            <p>Resultado: 
                <span>
                    <% out.print(imc.getResultado()); %>
                </span>
            </p>
        </div>
    </body>
</html>
