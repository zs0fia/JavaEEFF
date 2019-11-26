package hu.oe.hoe.web;

import hu.oe.hoe.adatok.Hybrid;
import hu.oe.hoe.adatok.Species;
import hu.oe.hoe.adatok.SpeciesRepository;
import hu.oe.hoe.adatok.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "EditHeroServlet", urlPatterns = {"/editHero"})
public class EditHeroServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int heroId = Integer.parseInt(request.getParameter("id"));
        User loggedInUser = (User)request.getSession().getAttribute("user");
       
        List<Hybrid> newHybrid = new ArrayList<>();
        for(Species sp: SpeciesRepository.instance.getSpecies()){
            newHybrid.add(new Hybrid(sp, Byte.parseByte(request.getParameter(sp.getName())))); 
        }
        
        loggedInUser.GetHeroById(heroId).setName(request.getParameter("name"));
        loggedInUser.GetHeroById(heroId).setDescription(request.getParameter("desc"));
        loggedInUser.GetHeroById(heroId).setHybrid(newHybrid);
        
        request.getSession().setAttribute("hero", loggedInUser.getHeroes());       
        request.getRequestDispatcher("/home.jsp").include(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
