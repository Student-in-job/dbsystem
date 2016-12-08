/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controll;

import API.UserSWT;
import Model.User;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ksinn
 */
public class Auth extends MyServlet {


    
    @Override
    protected void doMyGet(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        User user = new User();
        UserSWT wt = new UserSWT();
        if(wt.getDataFromRequest(request.getParameterMap(), user)){
                      
            user.getUserData();
            request.getSession().setAttribute("user_id", user.getId());
            request.getSession().setAttribute("user", user);
        }
        response.sendRedirect(request.getContextPath()+"/main");
    }

    
    @Override
    protected void doMyPost(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
    }

    @Override
    protected int PrivateMod() {
        return MyServlet.OnlyForUnAuthorized;
    }

}
