import controller.DBConnection;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Addfood;

/**
 *
 * @author Acer
 */
@WebServlet(urlPatterns = {"/AddNewFoodServlet1"})
public class AddNewFoodServlet1 extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String foodname = request.getParameter("foodname");
        String type = request.getParameter("type"); 
        String[] taste = request.getParameterValues("taste"); 
        String[] toppings = request.getParameterValues("topping"); 
        String foodPriceStr = request.getParameter("price"); 

        // Validate input
        if (foodname == null || foodname.trim().isEmpty() || foodPriceStr == null || foodPriceStr.trim().isEmpty()) {
            RequestDispatcher rd = request.getRequestDispatcher("/addNewFood.html");
            rd.forward(request, response);
            return;
        }

        try {
            // Convert foodPriceStr to a number, default to 0 if parsing fails
            double foodPrice = 0;
            try {
                foodPrice = Double.parseDouble(foodPriceStr.trim());
            } catch (NumberFormatException e) {
                // Handle case where foodPriceStr is not a valid number
                e.printStackTrace();
                RequestDispatcher rd = request.getRequestDispatcher("/addNewFood.html");
                rd.forward(request, response);
                return;
            }

            // Create Addfood object and set properties
            Addfood newFood = new Addfood();
            newFood.setName(foodname);
            newFood.setType(type);
            newFood.setTaste(taste != null ? String.join(",", taste) : ""); // Handle taste as a comma-separated string
            newFood.setToppings(toppings != null ? toppings : new String[0]);
            newFood.setPrice(foodPrice);

            // Store Addfood object in session
            HttpSession session = request.getSession();
            session.setAttribute("newFood", newFood);

            DBConnection dbConnection = new DBConnection();
            if (!dbConnection.insertNewFood(newFood)) {
                System.out.println(">>> AddNewFoodMySQL ERROR");
            }

            // Forward to success page
            RequestDispatcher rd = request.getRequestDispatcher("/addNewFoodSuccess.jsp");
            rd.forward(request, response);

        } catch (Exception e) {
            // Handle other exceptions
            e.printStackTrace();
            RequestDispatcher rd = request.getRequestDispatcher("/addNewFood.html");
            rd.forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
