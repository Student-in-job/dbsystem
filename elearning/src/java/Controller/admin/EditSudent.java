/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.admin;

import Controller.HttpServletParent;
import Model.User;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ksinn
 */
public class EditSudent extends HttpServletParent {

    
    @Override
    protected void doMyGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        int id;
        id = Integer.parseInt(request.getParameter("id"));
        User stud = new User();
        stud.getById(id);
        request.setAttribute("stud", stud);
        request.getRequestDispatcher("UserDataForm.jsp").forward(request, response);
    }

    @Override
    protected void doMyPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
            
        int id;
        id = Integer.parseInt(request.getParameter("id"));
        User stud = new User();
        stud.getById(id);        
            
                    String name = null;
                    String surname = null;
                    String mail = null;
                    String gender = null;

                    name = request.getParameter("name");
                    surname = request.getParameter("surname");
                    mail = request.getParameter("mail").toLowerCase();
                    gender = request.getParameter("gender");

                    stud.setMail(mail);
                    stud.setSurname(surname);
                    stud.setGender(gender);
                    stud.setName(name);
                    
                    if(stud.Update()){
                        response.sendRedirect("ListStudents");
                        return;
                    } else {
                        request.setAttribute("stud", stud);
                        request.getRequestDispatcher("UserDataForm.jsp").forward(request, response);
                        return;
                    }
    }

    @Override
    protected int PrivateMod() {
        return HttpServletParent.ForAll;
    }

}
