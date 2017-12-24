/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Course;

import Controller.HttpServletParent;
import Entety.Course;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author ksinn
 */
public class Edit extends HttpServletParent {

    @Override
    protected void doMyPost(HttpServletRequest request, HttpServletResponse response) throws Exception {

        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String discription = request.getParameter("discription");
        int duration = Integer.parseInt(request.getParameter("duration"));
        Part img = request.getPart("picture");

        Course program = new Course();
        program.getById(id);

        if (program.MayChange() && program.getUser().getId() == user.getId()) {

            program.setName(name);
            program.setDiscription(discription);
            program.setDuration(duration);

            if (program.Update()) {
                //program.SaveIco(img);
                response.sendRedirect("render?id=" + program.getId());
                return;
            } else {
                request.setAttribute("program", program);
                request.getRequestDispatcher("program_form.jsp").forward(request, response);
                return;
            }
        } else {
            request.setAttribute("message", "You cannot edit this component!");
            request.getRequestDispatcher("/message.jsp").forward(request, response);
        }

    }

    @Override
    protected int PrivateMod() {
        return HttpServletParent.OnlyForAuthorized;
    }

    @Override
    protected void doMyGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
        int id = Integer.parseInt(request.getParameter("id"));
        Course program = new Course();
        program.getById(id);
        if (program.MayChange() && program.getUser().getId() == user.getId()) {
            request.setAttribute("program", program);
            request.getRequestDispatcher("program_form.jsp").forward(request, response);
        } else {
            request.setAttribute("message", "You cannot edit this component!");
            request.getRequestDispatcher("/message.jsp").forward(request, response);
        }
    }

}
