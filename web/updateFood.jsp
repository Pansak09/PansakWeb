<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Arrays"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Addfood" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Food</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
    <h1>Update Food</h1>
    <%
        Addfood food = (Addfood) session.getAttribute("food");
        if (food != null) {
            String[] toppings = food.getToppings();
            Set<String> toppingSet = new HashSet<>(Arrays.asList(toppings)); // Convert array to set for easy lookup
    %>
    <form action="AddNewFoodServlet" method="post">
        <label for="foodName">Food Name:</label>
        <input type="text" id="foodName" name="foodName" value="<%= food.getName() %>" required><br><br>

        <label for="type">Type:</label>
        <select id="type" name="type" required>
            <option value="Mix" <%= "Mix".equals(food.getType()) ? "selected" : "" %>>Mix</option>
            <option value="Not Mix" <%= "Not Mix".equals(food.getType()) ? "selected" : "" %>>Not Mix</option>
        </select><br><br>

        <div class="topping">
            <label>Topping:</label><br>
            <input type="checkbox" id="Pearls" name="topping" value="Pearls" <%= toppingSet.contains("Pearls") ? "checked" : "" %>> Pearls<br>
            <input type="checkbox" id="FruitSalad" name="topping" value="Fruit Salad" <%= toppingSet.contains("Fruit Salad") ? "checked" : "" %>> Fruit Salad<br>
            <input type="checkbox" id="Ovaltine" name="topping" value="Ovaltine" <%= toppingSet.contains("Ovaltine") ? "checked" : "" %>> Ovaltine<br>
            <input type="checkbox" id="Oreo" name="topping" value="Oreo" <%= toppingSet.contains("Oreo") ? "checked" : "" %>> Oreo<br>
        </div>

        <div class="taste-group">
            <label>Taste:</label><br>
            <input type="radio" id="verySweet" name="taste" value="Very Sweet" <%= "Very Sweet".equals(food.getTaste()) ? "checked" : "" %>> Very Sweet<br>
            <input type="radio" id="littleSweet" name="taste" value="Little Sweet" <%= "Little Sweet".equals(food.getTaste()) ? "checked" : "" %>> Little Sweet<br>
            <input type="radio" id="notSweet" name="taste" value="Not Sweet" <%= "Not Sweet".equals(food.getTaste()) ? "checked" : "" %>> Not Sweet<br>
        </div>

        <label for="price">Price:</label>
        <input type="text" id="price" name="price" value="<%= food.getPrice() %>" required><br><br>

        <button type="submit">Update Food</button>
    </form>
    <%
        session.removeAttribute("food");
        } else {
    %>
    <p>No food found in session.</p>
    <%
        }
    %>
</body>
</html>
