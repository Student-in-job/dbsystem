/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Course;

import Controller.HttpServletParent;
import Entety.Course;
import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ksinn
 */
public class Open extends HttpServletParent {

    @Override
    protected void doMyGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    protected void doMyPost(HttpServletRequest request, HttpServletResponse response) throws Exception {

        PrintWriter out = response.getWriter();
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            Course course = new Course();
            course.getById(id);
            course.setStatus(1);
            if (course.Update()) {
                out.write("{'result':'ok'}");
            } else {
                out.write("{'result':'no'}");
            }
        } catch (Exception ex) {
            out.write("{'result':'error'}");
        }
        out.flush();
        out.close();
    }

    @Override
    protected int PrivateMod() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
