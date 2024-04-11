<%-- 
    Document   : salvar_produtos
    Created on : 11 de abr de 2024, 10:53:47
    Author     : CT Desenvolvimento
--%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
      <%
          int codigo;
          String nome;
          String marca;
          double preco;
          codigo = Integer.parseInt(request.getParameter("codigo"));
           nome = request.getParameter("nome");
            marca = request.getParameter("marca");
             preco = Double.parseDouble(request.getParameter("preco"));
             
        Connection conecta;
        PreparedStatement st;
        Class.forName("com.mysql.cj.jbdc.Driver");
        
        String url="jdbc:mysql://localhost:3307/bancojsp";
        String user = "root";
        String password = "";
        conecta=DriverManager.getConnection(url, user, password);
           
        String sql=("INSERT INTO produto VALUES (?, ?, ?,?)");
        st= conecta.prepareStatement(sql);
        st.setInt(1,codigo);//indica que será inserido no promeiro campo
        st.setString(2,nome);
        st.setString(3,marca);
        st.setDouble(4,preco);  
        st.executeUpdate ();// executa o comando INSERT
        out.print("<p><strong>Produto cadastrado com sucesso...</strong<p>");
         
          %>
    </body>
</html>
