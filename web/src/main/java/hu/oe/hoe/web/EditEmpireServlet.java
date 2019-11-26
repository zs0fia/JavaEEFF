package hu.oe.hoe.web;

import hu.oe.hoe.adatok.BuildingRepository;
import hu.oe.hoe.adatok.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "EditEmpireServlet", urlPatterns = {"/editEmpire"})
public class EditEmpireServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int empireId = Integer.parseInt(request.getParameter("id"));
        User loggedInUser = (User)request.getSession().getAttribute("user");
        
        loggedInUser.GetEmpireById(empireId).setName(request.getParameter("name"));
        loggedInUser.GetEmpireById(empireId).setDescription(request.getParameter("desc"));
        
        request.getSession().setAttribute("empire", loggedInUser.getEmpires());       
        request.getRequestDispatcher("/home.jsp").include(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
