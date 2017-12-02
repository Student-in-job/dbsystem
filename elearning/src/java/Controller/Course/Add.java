/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Course;

import Controller.HttpServletParent;
import Entety.Course;
import Entety.Program;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ksinn
 */
public class Add extends HttpServletParent {

    @Override
    protected void doMyPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    protected int PrivateMod() {
        return HttpServletParent.OnlyForAuthorized;
    }

    @Override
    protected void doMyGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
        int id = Integer.parseInt(request.getParameter("id"));
        Program program = new Program();
        program.getById(id);

        Course c = courseService.createCourse(program, new Date(), false, user);

        if (c != null) {
            response.sendRedirect("render?id=" + c.getId());
        } else {
            request.setAttribute("message", "You cannot create this cours!");
            request.getRequestDispatcher("/message.jsp").forward(request, response);
        }
    }

}
