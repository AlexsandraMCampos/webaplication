<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alteração de produto</title>
    </head>
    <body>
        <%
            //recebe o código do produto a alterar
            // e armazena na variavel
            int c;
            c = Integer.parseInt(request.getParameter("codigo"));

            // drive de conexão
            Connection conecta;
            PreparedStatement st;
            Class.forName("com.mysql.cj.jdbc.Driver");

            String url = "jdbc:mysql://localhost:3307/bancojsp";
            String user = "root";
            String password = "";
            conecta = DriverManager.getConnection(url, user, password);

            //buscar o produto pelo código digitado no form
            String sql = ("SELECT * FROM produto WHERE codigo= ?");
            st = conecta.prepareStatement(sql);
            st.setInt(1, c);

            ResultSet resultado = st.executeQuery();
            if (!resultado.next()) {
                out.print("Este produto não foi localizado.");
            } else {
        %>
        <form method="post" action="alterar_produtos.jsp">
            <p>
                <label for="codigo">Código: </label>
                <input type="number" name="codigo" id="codigo" value="<%=resultado.getString("codigo")%>">
                       </p>

            <p>
                <label for="nome">Nome do Produto: </label>
                <input type="text" name="nome" id="nome" value="<%=resultado.getString("nome")%>">
                       </p>

            <p>
                <label for="marca">Marca: </label>
                <input type="text" name="marca" id="marca" value="<%=resultado.getString("marca")%>">
                       </p>

            <p>
                <label for="preco">Preço: </label>
                <input type="number" name="preco" id="preco" value="<%=resultado.getString("preco")%>">
                       </p>

            <p>
                <input type="submit" value="Salvar Alterações">
            </p>

        </form>
        <%
            }// fechamento de chave do else
        %>         

        </body>
        </html>