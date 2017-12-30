<%-- 
    Document   : edit
    Created on : Dec 19, 2017, 11:10:05 AM
    Author     : quocq
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>edit</title>
    </head>
    <body>
        <form action="UpdateServlet" method="post">
    <label for="ID">username</label>
    <input type="text" name="username" id="username" readonly="readonly" value="${user.username}"/><br>
    <label for="name">password</label>
    <input type="password" name="password" id="password" value="${user.password}"/><br>
    <label for="fullname">fullname</label>
    <input type="text" name="fullname" id="fullname" value="${user.fullname}"/><br>
    <label for="photo">Photo</label>
    <input type="text" name="photo" id="photo" value="${user.photo}"/><br>
    <label for="email">email</label>
    <input type="text" name="email" id="email" value="${user.email}"/><br>
    <label for="level">level</label>
    <input type="text" name="level" id="level" value="${user.level}"/><br>
    <input type="submit" value="Edit">
</form>
    </body>
</html>
