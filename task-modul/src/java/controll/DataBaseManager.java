/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controll;

import Model.DBManeger;
import Model.TaskGroup;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ksinn
 */
public class DataBaseManager extends MyServlet {


    @Override
    protected void doMyGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

            request.getRequestDispatcher("DataBaseManager.jsp").forward(request, response);
        
    }


    @Override
    protected void doMyPost(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        request.setCharacterEncoding("UTF-8");
        String query = "";
        String message = "";
        query = request.getParameter("query");
        TaskGroup group = new TaskGroup(Integer.parseInt(request.getParameter("group")));
        if(group.getOwner()==user_id){
            DBManeger man = new DBManeger(query, group);
            message = man.getMessage();
        } else {
            throw new Exception("You cannot");
        }
        
        
        request.setAttribute("message", message);
        request.setAttribute("query", query);
            
        request.getRequestDispatcher("DataBaseManager.jsp").forward(request, response);
            
    }


    @Override
    protected int PrivateMod() {
        return MyServlet.OnlyForAuthorized;
    }

}
