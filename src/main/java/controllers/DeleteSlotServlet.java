package controllers;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/delete")
public class DeleteSlotServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int slotId = Integer.parseInt(req.getParameter("id"));
		SlotOperations so = new SlotOperations();
		boolean isDeleted = so.deleteSlot(slotId);
		if (isDeleted) {
			resp.sendRedirect("slots.jsp?success=deleted");
		} else {
			resp.sendRedirect("slots.jsp?error=Could not delete");
		}
	}
}
