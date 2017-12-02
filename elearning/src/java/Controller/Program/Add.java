/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Program;

import Controller.HttpServletParent;
import Entety.Program;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author ksinn
 */
public class Add extends HttpServletParent {

    @Override
    protected void doMyPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String name = request.getParameter("name");
        String discription = request.getParameter("discription");
        int duration = Integer.parseInt(request.getParameter("duration"));
        Part img = request.getPart("picture");

        Program program = new Program();
        
        program.setName(name);
        program.setDiscription(discription);
        program.setDuration(duration);
        
        if(program.Write(user)){
            //program.SaveIco(img);
            response.sendRedirect("render?id="+program.getId()); 
            return;
        } else {
            request.setAttribute("program", program);
            request.getRequestDispatcher("program_form.jsp").forward(request, response);
            return;
        }
           
    }

    @Override
    protected int PrivateMod() {
        return HttpServletParent.OnlyForAuthorized;
    }

    @Override
    protected void doMyGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.getRequestDispatcher("program_form.jsp").forward(request, response);
    }

    
}
