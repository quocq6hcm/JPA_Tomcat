<%@ page import="entities.Users" %>
<%@ page import="java.util.List" %>
<%-- 
    Document   : testAjax
    Created on : Dec 29, 2017, 7:15:38 PM
    Author     : quocq
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

    <head>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>

    <body>

        Search by username: <input type="text" id ="usernameSearch" />

        <input type="button" id="refresh" name="refresh" value="Refresh"/>

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
            <tbody id="tblBody">


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

            // $(document).ready(function () {
//                $('#btnSearch').on('click', function () {
            $('#refresh').on('click', function () {


                $.ajax({
                    url: 'AjaxServlet',
                    type: 'GET',
                    contentType: "application/json",
                    dataType: 'json',

                    data: {

                        userName: document.getElementById('usernameSearch').value

//                            userName: ${'usernameSearch'}.val()



                    },
                    success: function (obj) {
                        // var jsonVal =  <%=request.getAttribute("json")%>

                        alert('ok' + obj);
                        $("#tblBody").empty();
                        //alert("obj: " + obj[0]["password"])

                        // alert("num: "+Object.keys(obj).length);
                        for (var i = 0; i < obj.length; i++)
                        {
                            var body1 = "<tbody>";
                            var tr = "<tr>";
                            var td1 = "<td>" + obj[i]["username"] + "</td>";
                            var td2 = "<td>" + obj[i]["email"] + "</td>";
                            var td3 = "<td>" + obj[i]["fullname"] + "</td>";
                            var td4 = "<td><img src='resources/images/" + obj[i]["photo"] + "' height='80px'/></td>";
                            var td5 = "<td>" + obj[i]["level"] + "</td>";

                            var td6 = "<td> <a href='UpdateServlet?username=" + obj[i]["username"] + "'>Update </a> | <a href='DeleteServlet?username=" + obj[i]["username"] + "'>Delete </a></td></tr>";
                            var body2 = "</tbody>";
                            $("#tblData").append(body1 + tr + td1 + td2 + td3 + td4 + td5 + td6 + body2);
                        }
                    }
                    ,
                    error: function (e) {
                        alert('Error: ' + e);
                    }
                });
            });
            //      });


            $('#refresh').on('click', function () {


                $("#tblBody").empty();
            });
        </script>
    </body>
</html>

