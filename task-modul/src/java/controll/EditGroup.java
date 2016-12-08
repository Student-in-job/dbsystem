/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controll;



import Model.TaskGroup;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ksinn
 */
public class EditGroup extends MyServlet {


    @Override
    protected void doMyGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
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
            } else 
               throw new ServletException("You cannot see this page!");
        
    }

    
    @Override
    protected void doMyPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        
        
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

    
    @Override
    protected int PrivateMod() {
        return MyServlet.OnlyForAuthorized;
    }

}
