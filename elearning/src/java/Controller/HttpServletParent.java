package Controller;



/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Entety.User;
import Service.CourseService;
import Service.TaskService;
import Service.UserService;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ksinn
 */

public abstract class HttpServletParent extends HttpServlet {

    abstract protected void doMyGet(HttpServletRequest request, HttpServletResponse response) throws Exception;
    abstract protected void doMyPost(HttpServletRequest request, HttpServletResponse response) throws Exception;
    
    static protected int OnlyForAuthorized = 1;
    static protected int OnlyForUnAuthorized = 2;
    static protected int ForAll = 0;
    static protected UserService userService = new UserService();
    static protected CourseService courseService = new CourseService();
   static protected TaskService taskService = new TaskService();
    abstract protected int PrivateMod();
    
    protected User user;
    
    private void Chose(HttpServletRequest request, HttpServletResponse response) throws ServletException{
        
        try{
            this.user = (User) request.getSession().getAttribute("user");
            boolean canContinue = false;
            String mes = "";
            switch(this.PrivateMod()){
                case 0:{
                    canContinue = true;
                    break;
                }
                case 1:{
                    canContinue = user!=null;
                    mes = "This page only for avtorized user.";
                    break;
                }
                case 2:{
                    canContinue = user==null;
                    mes = "This page only for not avtorized user.";
                    break;
                }
                default: {
                    throw new ServletException("Error in Private Politics rule in page " + request.getContextPath()+"!");
                }
            }

            if(user==null)
                user = new User();
            

            if(canContinue){
                if(request.getMethod().equals("POST")){
                        this.doMyPost(request, response);
                        return;
                } else {
                        this.doMyGet(request, response);
                        return;
                }
            } else {
                throw new ServletException(mes);
            }
        } catch (Exception ex){
            throw new ServletException(ex);
        }
           
                
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            request.setCharacterEncoding("UTF-8");
            this.Chose(request, response);
        
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            request.setCharacterEncoding("UTF-8");
            this.Chose(request, response);
        
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
