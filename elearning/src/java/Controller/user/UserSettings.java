/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.user;

import Controller.HttpServletParent;
import Model.User;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ksinn
 */
public class UserSettings extends HttpServletParent {

   
    @Override
    protected void doMyGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        request.getRequestDispatcher("UserDataForm.jsp").forward(request, response);
    }

    @Override
    protected void doMyPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
                    String name = null;
                    String surname = null;
                    String mail = null;
                    String gender = null;

                    name = request.getParameter("name");
                    surname = request.getParameter("surname");
                    mail = request.getParameter("mail").toLowerCase();
                    gender = request.getParameter("gender");

                    user.setMail(mail);
                    user.setSurname(surname);
                    user.setGender(gender);
                    user.setName(name);
                    
                    response.sendRedirect("UserPanel");
    }

    @Override
    protected int PrivateMod() {
        return HttpServletParent.OnlyForAuthorized;
    }

}
