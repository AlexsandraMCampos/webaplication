<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar Produtos</title>
    </head>
    <body>
        <%
            //carrega os dados alterados no formulario carregaprod.jsp
            int codigo;
            String nome, marca;
            double preco;
            codigo = Integer.parseInt(request.getParameter("codigo"));
            nome = request.getParameter("nome");
            marca = request.getParameter("marca");
            preco = Double.parseDouble(request.getParameter("preco"));

            Connection conecta;
            PreparedStatement st;
            Class.forName("com.mysql.cj.jdbc.Driver");

            String url = "jdbc:mysql://localhost:3307/bancojsp";
            String user = "root";
            String password = "";
            conecta = DriverManager.getConnection(url, user, password);
            
            //alterar os dados na tabela produto do banco de dados
            String sql = ("UPDATE produto SET nome=?, marca=?, preco=? WHERE codigo=?");
            st = conecta.prepareStatement(sql);

            st= conecta.prepareStatement(sql);
            st.setString(1,nome);
            st.setString(2, marca);
            st.setDouble(3, preco);             
            st.setInt(4, codigo);
            
            // atualiza a tabela e informe o usuario da atulização
            st.executeUpdate();
            out.print("Os dados do produto " + codigo + " foram alterados");

        %>

    </body>
</html>
