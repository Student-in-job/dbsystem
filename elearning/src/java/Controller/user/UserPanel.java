/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.user;

import Controller.HttpServletParent;
import Model.Course;
import Model.Program;
import Model.Teaching;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ksinn
 */
public class UserPanel extends HttpServletParent {

    @Override
    protected void doMyGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        ArrayList<Teaching> learn_cours = user.getTeachings();
        ArrayList<Program> my_program = user.getMyProgram();
        ArrayList<Course> my_course = user.getCourseICreated();
        
        request.setAttribute("current_cours", learn_cours);
        request.setAttribute("my_courses", my_course);
        request.setAttribute("my_program", my_program);
        request.getRequestDispatcher("UserDataRender.jsp").forward(request, response);
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
