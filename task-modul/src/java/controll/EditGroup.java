/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controll;


import Model.Log;
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
public class EditGroup extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int group;
        TaskGroup new_group = new TaskGroup();
        try{
            group = Integer.parseInt(request.getParameter("group"));
            new_group.getById(group);
        } catch (Exception ex){
            response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp"); 
            return;
        }
        
        request.setAttribute("group", new_group);
        request.getRequestDispatcher("Group.jsp").forward(request, response);
        
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        
        int group;
        TaskGroup new_group = new TaskGroup();
        try{
            group = Integer.parseInt(request.getParameter("group"));
            new_group.getById(group);
        } catch (Exception ex){
            response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp"); 
            return;
        }
        
        new_group.setName(request.getParameter("name"));
        new_group.setPublish("true".equals(request.getParameter("publish")));
        
        boolean res;
        try{
            res = new_group.Update(1);

            if(res){
                response.sendRedirect(request.getServletContext().getContextPath()+"/owner/Group?group="+new_group.getId()); 
                return;
            } else {
                request.setAttribute("group", new_group);
                request.getRequestDispatcher("Group.jsp").forward(request, response);
                return;
            }
        } catch(Exception ex){
            Log.Write(ex.getLocalizedMessage());
            response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp"); 
            return;
        }
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
