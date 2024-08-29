<%@page import="java.util.Arrays"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Addfood" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Fruit</title>
</head>
<body>
    <%
        Addfood newFood = (Addfood) session.getAttribute("newFood");
        if (newFood == null) {
            out.println("No food data available.");
            return;
        }
    %>

    <h2>Edit Fruit</h2>
    <form action="AddNewFoodServlet1" method="post">
        <label for="foodname">Food Name:</label><br>
        <input type="text" id="foodname" name="foodname" value="<%= newFood.getName() %>" required><br>

        <label for="type">Type:</label>
        <select id="type" name="type" required>
            <option value="Mix" <%= "Mix".equals(newFood.getType()) ? "selected" : "" %>>Mix</option>
            <option value="Not Mix" <%= "Not Mix".equals(newFood.getType()) ? "selected" : "" %>>Not Mix</option>
        </select><br><br>

        <div class="topping">
            <label>Topping:</label><br>
            <input type="checkbox" id="Bubble" name="topping" value="Pearls" <%= newFood.getToppings() != null && Arrays.asList(newFood.getToppings()).contains("Pearls") ? "checked" : "" %>> Pearls<br>
            <input type="checkbox" id="FruitSalad" name="topping" value="Fruit Salad" <%= newFood.getToppings() != null && Arrays.asList(newFood.getToppings()).contains("Fruit Salad") ? "checked" : "" %>> Fruit Salad<br>
            <input type="checkbox" id="Ovaltine" name="topping" value="Ovaltine" <%= newFood.getToppings() != null && Arrays.asList(newFood.getToppings()).contains("Ovaltine") ? "checked" : "" %>> Ovaltine<br>
            <input type="checkbox" id="Oreo" name="topping" value="Oreo" <%= newFood.getToppings() != null && Arrays.asList(newFood.getToppings()).contains("Oreo") ? "checked" : "" %>> Oreo<br>
        </div>

        <div class="taste-group">
            <label>Taste:</label><br>
            <input type="radio" id="verySweet" name="taste" value="Very Sweet" <%= "Very Sweet".equals(newFood.getTaste()) ? "checked" : "" %>> Very Sweet<br>
            <input type="radio" id="littleSweet" name="taste" value="Little Sweet" <%= "Little Sweet".equals(newFood.getTaste()) ? "checked" : "" %>> Little Sweet<br>
            <input type="radio" id="notSweet" name="taste" value="Not Sweet" <%= "Not Sweet".equals(newFood.getTaste()) ? "checked" : "" %>> Not Sweet<br>
        </div>

        <label for="price">Price:</label>
        <input type="text" id="price" name="price" value="<%= newFood.getPrice() %>" required><br><br>

        <button type="submit">Submit</button>
    </form>

    <%
        session.removeAttribute("newFood");
    %>
</body>
</html>
