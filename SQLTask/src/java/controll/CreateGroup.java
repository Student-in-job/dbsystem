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
public class CreateGroup extends MyServlet {

    @Override
    protected void doMyGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("Group.jsp").forward(request, response);
    }

    @Override
    protected void doMyPost(HttpServletRequest request, HttpServletResponse response)
            throws Exception {      
        
        List list = getListFactory().create(request);            
        try {
            if (list.save()) {
                response.sendRedirect(request.getServletContext().getContextPath() + "/owner/Group?group=" + list.getId());
            } else {
                request.setAttribute("group", list);
                request.getRequestDispatcher("Group.jsp").forward(request, response);
            }
        } catch (Exception ex) {
            throw ex;
        }
    }

    @Override
    protected int PrivateMod() {
        return MyServlet.OnlyForAuthorized;
    }

}
