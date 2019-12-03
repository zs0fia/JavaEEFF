package hu.oe.hoe.web;

import Models.Empire;
import Models.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "CreateEmpireServlet", urlPatterns = {"/createEmpire"})
public class CreateEmpireServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Empire empire = new Empire(request.getParameter("name"), request.getParameter("desc"), 1);
        
        User sess = ((User)request.getSession().getAttribute("user"));
        //sess.getEmpires().add(empire);
        empire.setId(sess.getEmpires().size());
        sess.AddEmpire(empire);
        
        request.getSession().setAttribute("empire", sess.getEmpires());
        
        getServletContext().getRequestDispatcher("/home.jsp").include(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
