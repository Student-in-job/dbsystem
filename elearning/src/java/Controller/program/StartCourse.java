package Controller.program;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Controller.HttpServletParent;
import Model.Teaching;
import Model.User;
import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ksinn
 */
public class StartCourse extends HttpServletParent {

    @Override
    protected void doMyGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    protected void doMyPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        int id = 0;
        id = Integer.parseInt(request.getParameter("id"));
        Model.Course course = new Model.Course();
        course.getById(id);
        Teaching teach = new Teaching();
        teach.setCourse(id);
        int user_id = 0;
        if(user.getId() == course.getProgram().getUser().getId()){
            try{
                user_id = Integer.parseInt(request.getParameter("user"));
                User stud = new User();
                stud.getById(user_id);
                if(course.canAddToCourse(stud))
                    teach.setUser(user_id);

            } catch (Exception ex) {}
        } else {
            if(course.canStartCourse(user))
                teach.setUser(user.getId());
        }
        PrintWriter out = response.getWriter();
        if(teach.Write()){
            out.write("ok");
        } else {
            out.write("no");
        }
        out.flush();
        out.close();
        
    
    }

    @Override
    protected int PrivateMod() {
        return HttpServletParent.OnlyForAuthorized;
    }

    
}
