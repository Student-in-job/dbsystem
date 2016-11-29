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
public class EditGroup extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int user_id = (int) request.getSession().getAttribute("user_id");
        if(user_id!=0){
            int group;
            TaskGroup new_group = new TaskGroup();
            
            try{
                group = Integer.parseInt(request.getParameter("group"));
                new_group.getById(group);
            } catch (Exception ex){
                throw new ServletException(ex);
            }
            
            if(user_id==new_group.getOwner()){

                request.setAttribute("group", new_group);
                request.getRequestDispatcher("Group.jsp").forward(request, response);
                return;
            }
        }
        
        throw new ServletException("You cannot see this page!");
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        
        int user_id = (int) request.getSession().getAttribute("user_id");
        if(user_id!=0){
            int group;
            TaskGroup new_group = new TaskGroup();
            
            try{
                group = Integer.parseInt(request.getParameter("group"));
                new_group.getById(group);
            } catch (Exception ex){
                throw new ServletException(ex);
            }
            
            if(user_id==new_group.getOwner()){

                new_group.setName(request.getParameter("name"));
                new_group.setPublish("true".equals(request.getParameter("publish")));

                boolean res;
                try{
                    res = new_group.Update(user_id);

                    if(res){
                        response.sendRedirect(request.getServletContext().getContextPath()+"/owner/Group?group="+new_group.getId()); 
                        return;
                    } else {
                        request.setAttribute("group", new_group);
                        request.getRequestDispatcher("Group.jsp").forward(request, response);
                        return;
                    }
                } catch(Exception ex){
                    throw new ServletException(ex);
                }
            }
        }
        
        throw new ServletException("You cannot see this page!");
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
