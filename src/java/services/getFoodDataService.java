/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package services;

import controller.DBConnection;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.net.URLDecoder;
import java.util.Arrays;
import model.Addfood;
import org.json.JSONObject;

/**
 *
 * @author Acer
 */
public class getFoodDataService extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String requestUrl = request.getRequestURI();
        String name = requestUrl.substring("/PansakWeb/getFoodDataService/".length());

        name = URLDecoder.decode(name, "UTF-8");
        System.out.println(">>>>>>>>>>getFoodDataService: name=" + name);

        // retrieve food from MySQL: table food
        DBConnection dbConnection = new DBConnection();
        Addfood food = dbConnection.getFood(name);

        if (food != null) {
            String json = "{\n";
            json += "\"name\": " + JSONObject.quote(food.getName()) + ",\n";
            json += "\"type\": " + JSONObject.quote(food.getType()) + ",\n";
            json += "\"taste\": " + JSONObject.quote(food.getTaste()) + ",\n";
            json += "\"toppings\": " + JSONObject.quote(Arrays.toString(food.getToppings())) + ",\n";
            json += "\"foodPrice\": " + JSONObject.quote(Double.toString(food.getPrice())) + "\n";
            json += "}";
            response.getWriter().print(json);
        } else {
            response.getWriter().print("");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
