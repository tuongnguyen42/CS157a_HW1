<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>HW1 Demo</title>
    </head>
  <body>
    <h1>HW1 Demo</h1>
    
        <table border="1">
      <tr>
        <td>ID</td>
        <td>Name</td>
        <td>Age</td>
   </tr>
    <% 
     String db = "cs157a";
        String user; // assumes database name is the same as username
          user = "root";
        String password = "Chungu1234!";
        try {
            
            java.sql.Connection con; 
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs157a",user, password);
            out.println(db + " database successfully opened.<br/><br/>");
            
            out.println("Initial entries in table \"emp\": <br/>");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM emp");
            while (rs.next()) {
                out.println(rs.getInt(1) + " " + rs.getString(2) + " " + rs.getInt(3) + "<br/><br/>");
            }
            rs.close();
            stmt.close();
            con.close();
        } catch(SQLException e) { 
            out.println("SQLException caught: " + e.getMessage()); 
        }
    %>

  </body>
</html>
