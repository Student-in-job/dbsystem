/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controll;

import Model.StudentConnect;
import Model.Task;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ksinn
 */
public class RenderAdminTask extends HttpServlet {

    

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int user_id = (int) request.getSession().getAttribute("user_id");
        if(user_id!=0){
            
            int task;
            Task new_task = new Task();
            
            StudentConnect conn = new StudentConnect();
            try{
                task = Integer.parseInt(request.getParameter("task"));
                new_task.getById(task);
                conn.exequtQuery(new_task.getAnswer());
            } catch (Exception ex){
                throw new ServletException(ex);
            }

            if(user_id==new_task.getGroup().getOwner()){
                request.setAttribute("task", new_task);
                request.setAttribute("rs", conn.getResultArray());
                request.getRequestDispatcher("Task.jsp").forward(request, response);
                return;
            }
        }
        
        throw new ServletException("You cannot see this page!");
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
