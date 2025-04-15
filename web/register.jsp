<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Register New Student</title>
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
    background-color: white;
    padding: 30px 40px;
    border-radius: 12px;
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
    width: 100%;
    max-width: 400px;
    text-align: center;
}

h2 {
    color: #333;
}

label {
    display: block;
    text-align: left;
    font-weight: bold;
    margin-top: 10px;
}

input {
    width: 100%;
    padding: 8px;
    margin-top: 5px;
    border: 1px solid #ccc;
    border-radius: 6px;
}

button {
    margin-top: 15px;
    width: 100%;
    background: #4CAF50;
    color: white;
    padding: 10px;
    border: none;
    border-radius: 6px;
    font-size: 16px;
    cursor: pointer;
}

button:hover {
    background: #45a049;
}


    </style>
</head>

<body>
    <div class="container">
        <h2>Register New Student</h2>
        <form action="register" method="post">
            <label for="name">Student Name:</label>
            <input type="text" name="name" id="name" required>

            <label for="email">E-mail:</label>
            <input type="email" name="email" id="email" required>

            <label for="phone">Phone Number:</label>
            <input type="text" name="phone" id="phone">

            <label for="course">Course:</label>
            <input type="text" name="course" id="course">

            <button type="submit">Register</button>
        </form>
         <a href="dashboard">Back to Dashboard</a>
    </div>
</body>

</html>
