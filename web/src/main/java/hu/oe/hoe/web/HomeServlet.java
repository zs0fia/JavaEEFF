/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hu.oe.hoe.web;

import Repositories.BuildingRepository;
import Models.User;
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
@WebServlet(name = "HomeServlet", urlPatterns = {"/home"})
public class HomeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        getServletContext().getRequestDispatcher("/home.jsp").include(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        if(request.getParameter("type") == null){
            request.getRequestDispatcher("/home.jsp").include(request, response);
        }
        
        if(request.getParameter("type").equals("empire")){
            
            int empireId = Integer.parseInt(request.getParameter("id"));
            User loggedInUser = (User)request.getSession().getAttribute("user");
        
            if(request.getParameter("open") != null){      
                request.setAttribute("openEmpire", loggedInUser.GetEmpireById(empireId));
                request.setAttribute("openEmpireBuildings", loggedInUser.GetEmpireById(empireId).getBuildings());
                request.setAttribute("buildings", BuildingRepository.instance.getBuildings());
                request.setAttribute("naturals", loggedInUser.GetEmpireById(empireId).getProduce());
                request.getRequestDispatcher("/openEmpire.jsp").include(request, response);
            } else if(request.getParameter("edit") != null){
                request.setAttribute("editEmpire", loggedInUser.GetEmpireById(empireId));           
                request.getRequestDispatcher("/editEmpire.jsp").include(request, response);
            } else if(request.getParameter("remove") != null){
                loggedInUser.RemoveEmpireById(empireId);
            
                request.getSession().setAttribute("empire", loggedInUser.getEmpires());
                request.getRequestDispatcher("/home.jsp").include(request, response);
            }
            
        } else if(request.getParameter("type").equals("hero")){
            
            int heroId = Integer.parseInt(request.getParameter("id"));       
            User loggedInUser = (User)request.getSession().getAttribute("user");
        
            if(request.getParameter("edit") != null){
                request.setAttribute("editHero", loggedInUser.GetHeroById(heroId));
                request.getRequestDispatcher("/editHero.jsp").include(request, response);     
            }else{
                loggedInUser.RemoveHeroById(heroId);
            
                request.getSession().setAttribute("hero", loggedInUser.getHeroes());      
                request.getRequestDispatcher("/home.jsp").include(request, response);
            }
        }
        if(request.getParameter("logout") != null){
            request.getRequestDispatcher("/index.html").include(request, response);
        }
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
