/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controll;

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
public class RenderAdminGroup extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int group;
        TaskGroup task_group = new TaskGroup();
        try{
            group = Integer.parseInt(request.getParameter("group"));
            task_group.getById(group);
        } catch (Exception ex){
            throw new ServletException(ex);
        }
        
        request.setAttribute("group", task_group);
        request.setAttribute("tasks", task_group.getTasks());
        request.getRequestDispatcher("Group.jsp").forward(request, response);
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
