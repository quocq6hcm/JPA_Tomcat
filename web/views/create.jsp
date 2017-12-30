<%-- 
    Document   : create
    Created on : Dec 19, 2017, 10:47:00 AM
    Author     : quocq
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Create</title>
</head>
<body>
<form action="CreateServlet" method="post">
    <label for="username">username</label>
    <input type="text" name="username" id="username" /><br>
    <label for="fullname">fullname</label>
    <input type="text" name="fullname" id="fullname"/><br>
    <label for="password">password</label>
    <input type="password" name="password" id="password"/><br>
    <label for="photo">Photo</label>
    <input type="text" name="photo" id="photo"/><br>
    <label for="email">email</label>
    <input type="text" name="email" id="email"/><br>
    <label for="level">level</label>
    <input type="text" name="level" id="level"/><br>
    
    <input type="submit" value="Create">
</form>
</body>
</html>
