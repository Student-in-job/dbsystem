/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.program;

import Controller.HttpServletParent;
import Model.Course;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ksinn
 */
public class CreateCourse extends HttpServletParent {

    @Override
    protected void doMyGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
    
        int id = Integer.parseInt(request.getParameter("id"));
        Model.Program program = new Model.Program();
        program.getById(id);
        
        if(program.mayCreateCourse(user)){
            request.setAttribute("program", program);
            request.getRequestDispatcher("CourseDataForm.jsp").forward(request, response);
        } else {
            request.setAttribute("message", "You cannot create this cours!");
            request.getRequestDispatcher("/Message.jsp").forward(request, response);
        }
    
    }

    @Override
    protected void doMyPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        int id = Integer.parseInt(request.getParameter("id"));
        Model.Program program = new Model.Program();
        program.getById(id);
        
        if(program.mayCreateCourse(user)){
            SimpleDateFormat form = new SimpleDateFormat();
            form.applyPattern("yyyy-MM-dd");
            Date start = form.parse(request.getParameter("start_date"));
            boolean publ = "1".equals(request.getParameter("public"));
            if(start.before(new Date(System.currentTimeMillis()+1000*3600*24))){
                request.setAttribute("message", "Error date!");
                request.setAttribute("program", program);
                request.getRequestDispatcher("CourseDataForm.jsp").forward(request, response);
                return;
            } else {
                
                Course course = new Course();
                course.setProgram(id);
                course.ReadProgramFromDB();
                course.setStartDate(start);
                course.setPublic(publ);
                if(course.Create()){
                    response.sendRedirect("Course?id="+course.getId());
                    return;
                } else {
                    request.setAttribute("program", program);
                    request.getRequestDispatcher("CourseDataForm.jsp").forward(request, response);
                    return;
                }
            }
        } else {
            throw new Exception("You cannot");
        }
                        
               
    }

    @Override
    protected int PrivateMod() {
        return HttpServletParent.OnlyForAuthorized;
    }

    
}
