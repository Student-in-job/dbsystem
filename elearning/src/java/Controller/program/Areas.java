/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.program;

import Controller.HttpServletParent;
import Model.Area;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ksinn
 */
public class Areas extends HttpServletParent {

    @Override
    protected void doMyGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        List<Area> areas1=null, areas2=null;
        ArrayList<Area> areas = (new Area().getAll());
        int p;
        try{
            p = Integer.parseInt(request.getParameter("page"));
        }catch(Exception ex){
            p=1;
        }
        int b = p-1;
        int n = (p*8)<areas.size()?p+1:0;
        
        int l1=b*8, l2=b*8+4, l3=p*8;
        
        if(areas.size()>l1){
            if(areas.size()>l2+1){
                areas1 = areas.subList(l1, l2);
                if(areas.size()>l3)
                    areas2 = areas.subList(l2+1, l3);
                else 
                    areas2 = areas.subList(l2+1, areas.size());
            } else {
                areas1 = areas.subList(l1, areas.size());
            }
        } else {
            response.sendRedirect(request.getRequestURI()+"?page="+String.valueOf(p-1));
        }
        
        request.setAttribute("areas1", areas1);
        request.setAttribute("areas2", areas2);     
        request.setAttribute("befor", b);
        request.setAttribute("next", n);
        request.getRequestDispatcher("AreasRender.jsp").forward(request, response);
        
    }

    @Override
    protected void doMyPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    protected int PrivateMod() {
        return HttpServletParent.ForAll;
    }

    
}
