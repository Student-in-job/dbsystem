/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package auth;

import DataBasePak.Log;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Properties;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ksinn
 */
public class smsgetway extends HttpServlet {

    
    protected void processRequest(HttpServletResponse response, boolean status)
            throws ServletException, IOException {
        response.setContentType("text/plan;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println(status?"ok":"no");
            
        }
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        boolean res = false;
        String phone = request.getParameter("phone");
        String text = request.getParameter("text");
        //int livetime = Integer.parseInt(request.getParameter("livetime"));
        /*String[] cmd = new String[]{
        "sh", 
        "/home/ksinn/1.sh", 
        "/home/ksinn/key.txt",
        "'" + new Date().toString() + " " + phone + ": " + text+"\n'",
        };
      try {
          Process proc = Runtime.getRuntime().exec(cmd);
          processRequest(response, true);
      } catch (IOException ex) {
          processRequest(response, false);
      }*/
        
        try{
            Properties properties=new Properties();
            properties.setProperty("user","sms");
            properties.setProperty("password","gfhjkm");
            properties.setProperty("useUnicode","true");
            properties.setProperty("characterEncoding","UTF-8"); 
        
            Class.forName("com.mysql.jdbc.Driver");
            
            Connection conn = DriverManager.getConnection("jdbc:mysql://172.20.20.118/smsd", properties);
            
            PreparedStatement stmt = conn.prepareStatement("insert into outbox(number, text) value (?, ?);", PreparedStatement.RETURN_GENERATED_KEYS);
            
            stmt.setString(1, "+"+phone);
            stmt.setString(2, text);
            res = 1==1;//stmt.executeUpdate();
                        
            
        } catch (Exception ex) {
            Log.getOut(ex.getMessage());
        }
        
        processRequest(response, res);
        
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
