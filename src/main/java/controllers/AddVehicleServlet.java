package controllers;

import java.io.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AddVehicleServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId = 1; // Replace this with the logged-in user's ID
        String vehicleName = request.getParameter("vehicleName");
        String vehicleNumber = request.getParameter("vehicleNumber");
        String vehicleType = request.getParameter("vehicleType");

        try {
            boolean isInserted = VehicleOperations.addVehicle(userId, vehicleName, vehicleNumber, vehicleType);
            if(isInserted) {
            response.sendRedirect("my-vehicles.jsp");
            }else {
                response.getWriter().println("Error- Vehicle with the same number already exists.");        	
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error adding vehicle. Please try again.");
        }
    }
}
