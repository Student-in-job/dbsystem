/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.program;

import Controller.HttpServletParent;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ksinn
 */
public class Course extends HttpServletParent {

    
    @Override
    protected void doMyGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
        int id = 0;
        id = Integer.parseInt(request.getParameter("id"));
        Model.Course course = new Model.Course();
        course.getById(id);
        boolean student = course.canStartCourse(user);
        boolean admin = course.getProgram().getUser().getId() == user.getId();
        ArrayList students = course.getStudents();
        ArrayList marks = course.getMarks();
        ArrayList materials = course.getProgram().getMaterials();
        ArrayList tests = course.getProgram().getTests();
        ArrayList tasks = course.getProgram().getTasks();
        
        request.setAttribute("student", student);
        request.setAttribute("admin", admin);
        request.setAttribute("course", course);
        request.setAttribute("students", students);
        request.setAttribute("marks", marks);
        request.setAttribute("tasks", tasks);
        request.setAttribute("testa", tests);
        request.setAttribute("materials", materials);
        
        request.getRequestDispatcher("CourseDataRender.jsp").forward(request, response);
        
        
    }   

    @Override
    protected void doMyPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    protected int PrivateMod() {
        return HttpServletParent.ForAll;
    }

}
