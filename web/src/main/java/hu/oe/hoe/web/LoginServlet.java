package hu.oe.hoe.web;

import Exceptions.LoginException;
import Exceptions.RegistrationException;
import Repositories.SpeciesRepository;
import Models.User;
import Repositories.UserRepository;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author javaee
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String password =request.getParameter("password");
       
        try{
            User loggedInUser = UserRepository.instance.login(name, password);
            
            request.getSession().setAttribute("user", loggedInUser);
            request.getSession().setAttribute("species", SpeciesRepository.instance.getSpecies());
            request.getSession().setAttribute("heroes", loggedInUser.getHeroes());
            request.getSession().setAttribute("empires", loggedInUser.getEmpires());
            
            getServletContext().getRequestDispatcher("/home.jsp").include(request, response);
        }
        catch(LoginException e){response.getWriter().print("nem jó bejelenetkezés ");}
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
