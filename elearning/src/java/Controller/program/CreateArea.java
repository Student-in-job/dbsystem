/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.program;

import Controller.HttpServletParent;
import Model.Area;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ksinn
 */
public class CreateArea extends HttpServletParent {

   
    @Override
    protected void doMyGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.getRequestDispatcher("AreaDataForm.jsp").forward(request, response);
    }

    @Override
    protected void doMyPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        String name = request.getParameter("name");    
        Area na = new Area();
        na.setName(name);
        if(na.Write()){
            na.SaveIco(request.getPart("picture"));
            response.sendRedirect(request.getServletContext().getContextPath()+"/program/Area"); 
            return;
        } else {
            request.setAttribute("area", na);
            request.getRequestDispatcher("AreaDataForm.jsp").forward(request, response);
            return;
        }
        

        
    }

    @Override
    protected int PrivateMod() {
        return HttpServletParent.OnlyForAuthorized;
    }

}
