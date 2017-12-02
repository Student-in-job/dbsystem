/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controll;

import Model.TaskList;
import Model.User;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ksinn
 */
public class Main extends MyServlet {

    

    
    @Override
    protected void doMyGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {

            User user = (User) request.getSession().getAttribute("user");
            if(user==null){
                user = new User();
                user.setId(user_id);
                user.getUserData();
            }
            ArrayList<TaskList> list = TaskList.getByUserId(user_id);
            request.setAttribute("group_list", list);
            request.getRequestDispatcher("Main.jsp").forward(request, response);
    
    }

    
    @Override
    protected void doMyPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

   
    @Override
    protected int PrivateMod() {
        return MyServlet.OnlyForAuthorized;
    }

}
