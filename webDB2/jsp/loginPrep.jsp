<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ page import = "java.io.*,java.util.*, java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <title>LOGIN</title>
    </head>
    <body>
     <% 
            
            try {
                
            String connectionUrl = "jdbc:sqlserver://213.140.22.237\\SQLEXPRESS:1433;databaseName=barletta.nicolas;user=barletta.nicolas;password=xxx123#";

            // l'istruzione seguente è fondamentale altrimenti non viene caricato il driver

            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            // Load SQL Server JDBC driver and establish connection.
            Connection connection = DriverManager.getConnection(connectionUrl);

            //inserimento di un nuovo giudice
            Statement stmt = connection.createStatement();
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String sql = "SELECT * FROM Utenti FROM Utente WHERE Username = ? AND Pw = ? ";
            PreparedStatement prepStmt = connection.prepareStatement(sql);
            prepStmt.setString(1, username);
            prepStmt.setString(2, Password);
            ResultSet rs = prepStmt.executeQuery();
            if(rs.next())
            {
                out.println("Benvenuto " + rs.getString("Nome"));   
            } 
            else 
            {
                out.println("Chi zzoca sei");  
            }
            connection.close();
            } catch(Exception e){
                out.println(e);
            } %>
    </body>
</html>