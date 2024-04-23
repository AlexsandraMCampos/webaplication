<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exclusão de produtos</title>
    </head>
    <body>

        <%
            // receber o código no formulario
            int cod;
            cod = Integer.parseInt(request.getParameter("codigo"));
            // conecta ao Banco de Dados
            try{
                // fazendo a conexão com o banco de dados 
                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.cj.jdbc.Driver");

                String url = "jdbc:mysql://localhost:3307/bancojsp";
                String user = "root";
                String password = "";

                conecta = DriverManager.getConnection(url, user, password);

                // exclui o produto do codigo informado no form.
                String sql = ("DELETE FROM produto WHERE codigo=?");
                st = conecta.prepareStatement(sql);
                st.setInt(1, cod);
                int resultado = st.executeUpdate(); // executa o DELETE 
                //verificar se o produto foi ou não excluido
                if (resultado == 0) {
                    out.print("Este produto não está cadastrado.");
                } else {
                    out.print("O produto de código = " + cod + "foi excluido");
            }
                }catch(Exception erro){
                    String mensagemErro = erro.getMessage();
                    out.print("Entre em contato com o suporte e informe o erro" + mensagemErro);
            }

        %>
    </body>
</html>
