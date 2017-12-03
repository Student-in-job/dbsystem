/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controll;


import Struct.List;
import static Struct.TasKer.getListFactory;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ksinn
 */
public class EditGroup extends MyServlet {

    @Override
    protected void doMyGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int group;
        List list;
        try {
            group = Integer.parseInt(request.getParameter("group"));
            list = getListFactory().createById(group);
        } catch (Exception ex) {
            throw new ServletException(ex);
        }

        if (user_id == list.getUserId()) {
            request.setAttribute("group", list);
            request.getRequestDispatcher("Group.jsp").forward(request, response);
        } else {
            request.setAttribute("message", "You cannot edit this group!");
            request.getRequestDispatcher("/Message.jsp").forward(request, response);
        }

    }

    @Override
    protected void doMyPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {

        int group = Integer.parseInt(request.getParameter("group"));
        List list = getListFactory().createById(group);
        if (user_id == list.getUserId()) {
            list = getListFactory().create(request, list);
            try {
                if (list.update()) {
                    response.sendRedirect(request.getServletContext().getContextPath() + "/owner/Group?group=" + list.getId());
                } else {
                    request.setAttribute("group", list);
                    request.getRequestDispatcher("Group.jsp").forward(request, response);
                }
            } catch (Exception ex) {
                throw ex;
            }
        } else {
            request.setAttribute("message", "You cannot edit this group!");
            request.getRequestDispatcher("/Message.jsp").forward(request, response);
        }

    }

    @Override
    protected int PrivateMod() {
        return MyServlet.OnlyForAuthorized;
    }

}
