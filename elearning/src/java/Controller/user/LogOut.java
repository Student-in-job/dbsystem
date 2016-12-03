package Controller.user;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Controller.HttpServletParent;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ksinn
 */
public class LogOut extends HttpServletParent {

    
    @Override
    protected void doMyGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
        user.LogOut();
        request.getSession().invalidate();
        response.sendRedirect(request.getContextPath());
        
    }

    @Override
    protected void doMyPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    protected int PrivateMod() {
        return HttpServletParent.OnlyForAuthorized;
    }

}
