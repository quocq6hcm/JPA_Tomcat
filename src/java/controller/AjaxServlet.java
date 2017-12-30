/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.google.gson.Gson;
import entities.Users;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author quocq
 */
@WebServlet(name = "AjaxServlet", urlPatterns = {"/AjaxServlet"})
public class AjaxServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    EntityManagerFactory emf = Persistence.createEntityManagerFactory("JPA_TomcatPU");

    UsersJpaController _db = new UsersJpaController(emf);

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String username = request.getParameter("userName").trim();
            System.out.println(username);
            if (username.equals(null) || username.equals("")) {
                username = "null cmnr";
            }
            Users temp = new Users();
            temp = _db.findUsers(username);
            List<entities.Users> list = new ArrayList<>();
            list.add(temp);
            String json = new Gson().toJson(list);

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            request.setAttribute("list", list);
            System.out.println(json);
            out.write(json);
        }
        request.getRequestDispatcher("views/testAjax.jsp").forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String username = request.getParameter("userName").trim();
            System.out.println(username);
            if (username.equals(null) || username.equals("")) {
                username = "null cmnr";
            }
            List<entities.Users> list = new ArrayList<>();
            for ( int i=0; i<_db.findUsersEntities().size(); i++)
            {
                Users temp =_db.findUsersEntities().get(i);
                if(temp.getUsername().contains(username))
                {
                    list.add(temp);
                }
                
            }
            
           
          
            String json = new Gson().toJson(list);

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            request.setAttribute("list", list);
            System.out.println(json);

            request.setAttribute("json", "testString");

            PrintWriter pw = response.getWriter();

            response.setContentType("text/html;charset=UTF-8");

            pw.println(json);

        } catch (Exception e) {
            e.printStackTrace();
        }

        //request.getRequestDispatcher("views/testAjax.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
