<%@ page import="java.sql.*, com.mycompany.adminpanel.DBConnection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    String name = "", email = "", phone = "", course = "";
    Connection con = DBConnection.getConnection();
    try {
        PreparedStatement ps = con.prepareStatement("SELECT * FROM student WHERE id=?");
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        if(rs.next()){
            name = rs.getString("name");
            email = rs.getString("email");
            phone = rs.getString("phone");
            course = rs.getString("course");
        }
    } catch(Exception e) {
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Update Student</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #a1c4fd, #c2e9fb);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 350px;
            text-align: center;
        }

        label {
            display: block;
            margin-top: 10px;
            font-weight: bold;
            text-align: left;
        }

        input {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        button {
            margin-top: 15px;
            width: 100%;
            padding: 10px;
            border: none;
            background: #007bff;
            color: white;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background: #0056b3;
        }

        a {
            display: block;
            margin-top: 10px;
            text-decoration: none;
            color: #007bff;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Update Student</h2>
        <form action="update" method="post">
            <input type="hidden" name="id" value="<%= id %>">

            <label for="name">Student Name:</label>
            <input type="text" name="name" id="name" value="<%= name %>" required>

            <label for="email">E-mail:</label>
            <input type="email" name="email" id="email" value="<%= email %>" required>

            <label for="phone">Phone Number:</label>
            <input type="text" name="phone" id="phone" value="<%= phone %>">

            <label for="course">Course:</label>
            <input type="text" name="course" id="course" value="<%= course %>">

            <button type="submit">Update</button>
        </form>
        <a href="dashboard">Back to Dashboard</a>
    </div>
</body>
</html>