package hu.oe.hoe.web;

import hu.oe.hoe.adatok.Hero;
import hu.oe.hoe.adatok.Hybrid;
import hu.oe.hoe.adatok.RegistrationException;
import hu.oe.hoe.adatok.Species;
import hu.oe.hoe.adatok.SpeciesRepository;
import hu.oe.hoe.adatok.User;
import hu.oe.hoe.adatok.UserRepository;
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
@WebServlet(name = "HeroServlet", urlPatterns = {"/createHero"})
public class CreateHeroServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        Hero hero = new Hero(request.getParameter("name"),request.getParameter("desc"));
        for(Species sp: SpeciesRepository.instance.getSpecies()){
            Hybrid nh = new Hybrid(sp, Byte.parseByte(request.getParameter(sp.getName())));
            hero.getHybrid().add(nh);
           
        }
        
        User sess = ((User)request.getSession().getAttribute("user"));
        sess.getHeroes().add(hero);
        
        request.getSession().setAttribute("heroes", sess.getHeroes());
        
        getServletContext().getRequestDispatcher("/home.jsp").include(request, response);     
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
