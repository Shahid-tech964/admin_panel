package com.mycompany.adminpanel;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {

    public static class Student {
        public int id;
        public String name;
        public String email;
        public String phone;
        public String course;
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Check if admin is logged in
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        List<Student> students = new ArrayList<>();
        Connection con = DBConnection.getConnection();
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM student");
            while (rs.next()) {
                Student s = new Student();
                s.id = rs.getInt("id");
                s.name = rs.getString("name");
                s.email = rs.getString("email");
                s.phone = rs.getString("phone");
                s.course = rs.getString("course");
                students.add(s);
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        request.setAttribute("students", students);
        request.getRequestDispatcher("dashboard.jsp").forward(request, response);
    }
}
