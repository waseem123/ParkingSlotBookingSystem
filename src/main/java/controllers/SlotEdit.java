package controllers;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Slot;

@WebServlet("/save-slot-changes")
public class SlotEdit extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int slotId = Integer.parseInt(req.getParameter("slot_id"));
		String slotName = req.getParameter("slot_name");
		String slotLocation = req.getParameter("slot_location");
		String vehicleType = req.getParameter("vehicle_type");
		double slotPrice = Double.parseDouble(req.getParameter("slot_price"));
		boolean slotAvailable = Boolean.parseBoolean(req.getParameter("slot_available"));
		
		Slot s = new Slot(slotId,slotName,slotLocation,slotAvailable,slotPrice,vehicleType);
		SlotOperations so = new SlotOperations();
		boolean isSaved = so.saveChanges(s);
		
		if (isSaved) {
            resp.sendRedirect("slots.jsp?success=saved");
        } else {
            resp.sendRedirect("slots.jsp?error=Could not save");
        }
	}
	
	

}
