<%-- 
    Document   : getSrikaiFoodREST
    Created on : 4 ส.ค. 2567, 20:24:20
    Author     : pansa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ร้านน้ำFinver</title>
    </head>
    <body>
        <h2>ร้านน้ำFinver</h2>
        <!-- Corrected the form action parameter name to match the servlet's expected parameter -->
        <form action="ShowAllUpdatedFoodServerlet">
            <input type="text" name="foodname" placeholder="Enter food name"> <!-- Changed 'foodname' to 'foodName' -->
            <input type="submit" value="Search">
        </form>
    </body>
</html>
