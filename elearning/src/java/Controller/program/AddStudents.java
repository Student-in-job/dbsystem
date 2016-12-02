/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.program;

import Controller.HttpServletParent;
import Model.User;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ksinn
 */
public class AddStudents extends HttpServletParent {

    @Override
    protected void doMyGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        int id = 0;
        id = Integer.parseInt(request.getParameter("id"));
        Model.Course course = new Model.Course();
        course.getById(id);
        ArrayList<User> students = course.getOutStudents();
        
        request.setAttribute("users", students);
        request.setAttribute("course", course);
        
        request.getRequestDispatcher("ListStudents.jsp").forward(request, response);
        
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
