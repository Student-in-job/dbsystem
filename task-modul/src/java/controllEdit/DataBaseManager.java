/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllEdit;

import Model.DBManeger;
import Model.TaskGroup;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ksinn
 */
public class DataBaseManager extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

            request.getRequestDispatcher("DataBaseManager.jsp").forward(request, response);
        
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        String query = "";
        String message = "";
        query = request.getParameter("query");
        try{
            DBManeger man = new DBManeger(query, new TaskGroup(Integer.parseInt(request.getParameter("group"))));
            message = man.getMessage();
        }catch(Exception ex){
            response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp"); 
            return;
        }
        
        request.setAttribute("messsage", message);
        request.setAttribute("query", query);
            
        request.getRequestDispatcher("DataBaseManager.jsp").forward(request, response);
            
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
