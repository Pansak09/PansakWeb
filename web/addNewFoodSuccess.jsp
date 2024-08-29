<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="model.Addfood" %>
<!DOCTYPE html>
<html>
<head>
    <title>แสดงข้อมูลอาหาร</title>
</head>
<body>
    <% 
        Addfood newFood = (Addfood) session.getAttribute("newFood");
        if (newFood != null) {
    %>
    <p>อาหารที่เพิ่มได้แล้ว</p>
    <p>ชื่อ: <%= newFood.getName() %><br/>
    ประเภท: <%= newFood.getType() %><br/>
    วัตถุดิบ: 
    <% 
        String[] toppings = newFood.getToppings();
        if (toppings != null && toppings.length > 0) {
            for (String topping : toppings) {
    %>
    <%= topping %>&nbsp;
    <% 
            }
        } else {
    %>
    (ไม่มีวัตถุดิบ)<br/>
    <% 
        }
    %>
    รส: <%= newFood.getTaste() %><br/>
    ราคา: <%= newFood.getPrice() %></p>
    <a href="ShowUpdatedFood.jsp">แก้ไขข้อมูล</a>
    <a href="addNewFood.html">เพิ่มข้อมูล</a>
    <% 
        } else { 
    %>
    <p>No food found in session.</p>
    <% 
        } 
    %>
</body>
</html>
