/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controll;

import Model.TaskList;
import Struct.List;
import static Struct.TasKer.getListFactory;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ksinn
 */
public class RenderAdminGroup extends MyServlet {

    @Override
    protected void doMyGet(HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        int group = Integer.parseInt(request.getParameter("group"));
        List list = getListFactory().createById(group);

        if (user_id == list.getUserId()) {

            request.setAttribute("group", list);
            request.setAttribute("tasks", list.getTasks());
            request.getRequestDispatcher("Group.jsp").forward(request, response);
        } else {
            throw new ServletException("You are not owner this work");
        }

    }

    @Override
    protected void doMyPost(HttpServletRequest request, HttpServletResponse response)
            throws Exception {

    }

    @Override
    protected int PrivateMod() {
        return MyServlet.OnlyForAuthorized;
    }

}
