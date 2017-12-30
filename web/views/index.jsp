<%@ page import="entities.Users" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: hoang
  Date: 09-Nov-17
  Time: 09:18
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <script>
//            $(document).ready(function(){
//    $('#tblData').DataTable();
//});
            function submitClicked()
            {
                alert('asd');
            }
            
            function reload()
            {
                var mytbl = $("#tblData").datatable();
                mytbl.ajax.reload();
            }
          

        </script>
<!--       <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.16/datatables.min.css"/>
 
<script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.16/datatables.min.js"></script>-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <META http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List</title>
    </head>
    <body> Search by username: <input type="text" id ="usernameSearch" />
        <input type ="button" value="Search" name="btnSearch" id="btnSearch" onclick="submitClicked();"/>
        
        

        <a href="CreateServlet">Create User</a>

        <table border="1" cellspacing="0" cellpadding="5" id='tblData'>
            <caption><h1>List of Users</h1></caption>
            <thead>
                <tr>
                    <td>Username</td>
                    <td>Email</td>
                    <td>Fullname</td>
                    <td>Photo</td>
                    <td>Level</td>
                </tr>
            </thead>
            <tbody>


                <c:forEach items="${list}" var="e">
                    <tr>
                        <td>${e.username}</td>
                        <td>${e.email}</td>
                        <td>${e.fullname}</td>
                        <td><img src="resources/images/${e.photo}" alt="${e.photo}" height="80px"></td>
                        <td>${e.level}</td>
                        <td><a href="UpdateServlet?username=${e.username}">Update</a> <a href="DeleteServlet?username=${e.username}"
                                                                                         onclick="return confirm('are you sure delete this employee ?');">Delete</a>
                        </td>
                    </tr>
                </c:forEach>

            </tbody>
        </table>
        
        <script>
            $(document).ready(function () {
//                $('#btnSearch').on('click', function () {
                $('#usernameSearch').blur(function () {
     
        
                    $.ajax({
                        url: 'SearchServlet',
                       
                        contentType: "application/json",
                        data: {
                           
                            userName: document.getElementById('usernameSearch').value
                            
//                            userName: ${'usernameSearch'}.val()



                        },
                        
                        
                    });
                });
            });
      
      
        </script>
        
        
    </body>
</html>
