package controllers;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Slot;

@WebServlet("/new-slot")
public class AddSlotServlet extends HttpServlet{
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String slotName = request.getParameter("slot_name");
		String slotLocation = request.getParameter("slot_location");
		String vehicleType = request.getParameter("vehicle_type");
		double slotPrice = Double.parseDouble(request.getParameter("slot_price"));
		Slot s = new Slot();
		s.setSlotName(slotName);
		s.setSlotLocation(slotLocation);
		s.setSlotVehicleType(vehicleType);
		s.setSlotPrice(slotPrice);
		
        SlotOperations so = new SlotOperations();
        boolean isSaved = so.saveSlot(s);

        if (isSaved) {
            response.sendRedirect("slots.jsp?success=saved");
        } else {
            response.sendRedirect("slots.jsp?error=Could not save");
        }
	}
}
