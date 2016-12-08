/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.program;

import Controller.HttpServletParent;
import Model.Area;
import Model.Program;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author ksinn
 */
public class CreateProgram extends HttpServletParent {

    @Override
    protected void doMyGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        ArrayList<Area> areas = (new Area()).getAll();
        request.setAttribute("areas", areas);
        request.getRequestDispatcher("ProgramDataForm.jsp").forward(request, response);
    }

    @Override
    protected void doMyPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String name = request.getParameter("name");
        String discription = request.getParameter("discription");
        int area = Integer.parseInt(request.getParameter("area"));
        int level = Integer.parseInt(request.getParameter("level"));
        int duration = Integer.parseInt(request.getParameter("duration"));
        Part img = request.getPart("picture");

        Program program = new Program();
        
        program.setName(name);
        program.setArea(area);
        program.setDiscription(discription);
        program.setLevel(level);
        program.setDuration(duration);
        
        if(program.Write(user)){
            program.SaveIco(img);
            response.sendRedirect("Program?id="+program.getId()); 
            return;
        } else {
            ArrayList<Area> areas = (new Area()).getAll();
            program.ReadAreaFromDB();
            request.setAttribute("areas", areas);
            request.setAttribute("program", program);
            request.getRequestDispatcher("ProgramDataForm.jsp");
            return;
        }
           
    }

    @Override
    protected int PrivateMod() {
        return HttpServletParent.OnlyForAuthorized;
    }

    
}
