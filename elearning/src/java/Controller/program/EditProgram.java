/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.program;

import Controller.HttpServletParent;
import Model.Area;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author ksinn
 */
public class EditProgram extends HttpServletParent {

    
    @Override
    protected void doMyGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        int id;
        id = Integer.parseInt(request.getParameter("id"));
        Model.Program program = new Model.Program();
        program.getById(id);
        
        if(program.MayChange()&&program.getUser().getId()==user.getId()){
            ArrayList<Area> areas = (new Area()).getAll();
        
            request.setAttribute("areas", areas);
            request.setAttribute("program", program);

            request.getRequestDispatcher("ProgramDataForm.jsp").forward(request, response);
            return;
            
        } else {
            throw new Exception("You cannot");            
        }
        
        
    }

    @Override
    protected void doMyPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
    
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String discription = request.getParameter("discription");
        int area = Integer.parseInt(request.getParameter("area"));
        int level = Integer.parseInt(request.getParameter("level"));
        int duration = Integer.parseInt(request.getParameter("duration"));
        Part img = request.getPart("picture");

        Model.Program program = new Model.Program();
        program.getById(id);
        
        program.setName(name);
        program.setArea(area);
        program.setDiscription(discription);
        program.setLevel(level);
        program.setDuration(duration);
        
        if(program.Update(user)){
            program.SaveIco(img);
            response.sendRedirect("Program?"+program.getId()); 
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
