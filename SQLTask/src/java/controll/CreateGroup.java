/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controll;


import Model.TaskList;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ksinn
 */
public class CreateGroup extends MyServlet {


    
    @Override
    protected void doMyGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.getRequestDispatcher("Group.jsp").forward(request, response);
    }

    
    @Override
    protected void doMyPost(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
       
            request.setCharacterEncoding("UTF-8");

            TaskList new_group = new TaskList();

            new_group.setName(request.getParameter("name"));
            new_group.setPublish("1".equals(request.getParameter("publish")));

            boolean res;
                res = new_group.Write(user_id);

                if(res){
                    response.sendRedirect(request.getServletContext().getContextPath()+"/owner/Group?group="+new_group.getId()); 
                    return;
                } else {
                    request.setAttribute("group", new_group);
                    request.getRequestDispatcher("Group.jsp").forward(request, response);
                    return;
                }
    }

    
    @Override
    protected int PrivateMod() {
        return MyServlet.OnlyForAuthorized;
    }

}
