/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.program;

import Controller.HttpServletParent;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ksinn
 */
public class CreateProgram extends HttpServletParent {

    @Override
    protected void doMyGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.getRequestDispatcher("ProgramDataForm.jsp").forward(request, response);
    }

    @Override
    protected void doMyPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
        name = request.getParameter("name");
        inventory = request.getParameter("inventory");
        area = Integer.parseInt(request.getParameter("area")==null?"0":request.getParameter("area"));
        typ = "Standart";//request.getParameter("typ");
        level = Integer.parseInt(request.getParameter("level")==null?"0":request.getParameter("level"));
        minlevel = Integer.parseInt(request.getParameter("minlevel")==null?"0":request.getParameter("minlevel"));
        duration = Integer.parseInt(request.getParameter("duration")==null?"0":request.getParameter("duration"));
        img = request.getPart("picture");

        if(minlevel<=level){
        
    
            if(program==0){
                    np = new Program(name, inventory, new Area(area), typ, level, minlevel, duration);
                    np.Write(user, img);
                    response.sendRedirect(request.getServletContext().getContextPath()+"/Course.jsp?course_id="+np.getId()); return;
            }
            else{
                np = new Program(program);
                np.Change(name, inventory, typ, level, minlevel, duration, user, img);
                response.sendRedirect(request.getServletContext().getContextPath()+"/Course.jsp?course_id="+np.getId()); return;
            }
        }
    }

    @Override
    protected int PrivateMod() {
        return HttpServletParent.OnlyForAuthorized;
    }

    
}
