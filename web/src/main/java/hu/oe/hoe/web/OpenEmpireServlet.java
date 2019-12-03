package hu.oe.hoe.web;

import Models.Building;
import Repositories.BuildingRepository;
import Models.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "OpenEmpireServlet", urlPatterns = {"/openEmpire"})
public class OpenEmpireServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        if(request.getParameter("build") != null){
//            
//            Building b = BuildingRepository.instance.getBuildingById(Integer.parseInt(request.getParameter("buildingId")));
//            //Building b = (Building)BuildingRepository.instance.getBuildingById(Integer.parseInt(request.getParameter("buildingId")));
//            //List<Building> b = (List<Building>)request.getValue("buildings");
//        
//            int empireId = Integer.parseInt(request.getParameter("emprireId"));
//            User loggedInUser = (User)request.getSession().getAttribute("user");
//        
//            loggedInUser.GetEmpireById(empireId).addNewBuilding(b);
//        
//            request.getSession().setAttribute("empire", loggedInUser.getEmpires());       
//            request.getRequestDispatcher("/home.jsp").include(request, response);
//        }
//        else{}
        if(request.getParameter("return") != null || request.getParameter("build") != null){
            User loggedInUser = (User)request.getSession().getAttribute("user");
            request.getSession().setAttribute("empire", loggedInUser.getEmpires());       
            request.getRequestDispatcher("/home.jsp").include(request, response);
        }
        else{}
//        Building b = BuildingRepository.instance.getBuildingById(Integer.parseInt(request.getParameter("buildingId")));
//        
//        int empireId = Integer.parseInt(request.getParameter("emprireId"));
//        User loggedInUser = (User)request.getSession().getAttribute("user");
//        
//        loggedInUser.GetEmpireById(empireId).addNewBuilding(b);
//        
//        request.getSession().setAttribute("empire", loggedInUser.getEmpires());       
//        request.getRequestDispatcher("/home.jsp").include(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
