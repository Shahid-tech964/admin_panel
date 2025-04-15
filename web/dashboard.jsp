<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.mycompany.adminpanel.DashboardServlet.Student" %>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
    <!-- Bootstrap CSS -->
    <link 
      rel="stylesheet" 
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
    />
    <style>
         body {
            background: linear-gradient(to right, #a1c4fd, #c2e9fb);

        }
    </style>
</head>
<body>
<div class="container my-5">
    <!-- Header + Sign Out + Add New Student -->
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="mb-0">Student Dashboard</h2>
        <div>
            <a href="logout" class="btn btn-danger me-2">Sign Out</a>
            <a href="register" class="btn btn-primary">Add New Student</a>
        </div>
    </div>
    
    <!-- Student Table -->
    <table class="table table-striped table-hover">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Student Name</th>
                <th>E-mail</th>
                <th>Phone Number</th>
                <th>Course</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
        <%
            List<Student> students = (List<Student>) request.getAttribute("students");
            if (students != null) {
                for (Student s : students) {
        %>
            <tr>
                <td><%= s.id %></td>
                <td><%= s.name %></td>
                <td><%= s.email %></td>
                <td><%= s.phone %></td>
                <td><%= s.course %></td>
                <td>
                    <a href="update.jsp?id=<%= s.id %>" class="btn btn-warning btn-sm">
                        Edit
                    </a>
                    <a href="delete?id=<%= s.id %>" 
                       onclick="return confirm('Are you sure?')" 
                       class="btn btn-danger btn-sm">
                        Delete
                    </a>
                </td>
            </tr>
        <%
                }
            }
        %>
        </tbody>
    </table>
</div>

<!-- Bootstrap JS (optional, for interactive components) -->
<script 
  src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js">
</script>
</body>
</html>
