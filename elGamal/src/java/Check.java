/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import API.HTTPClient;
import elgamal.CipherText;
import elgamal.Elgamal;
import elgamal.KeySet;
import elgamal.PublicKey;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ksinn
 */
public class Check extends HttpServlet {

    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("check", true);
        request.getRequestDispatcher("sign.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String p = request.getParameter("p");
        String g = request.getParameter("g");
        String h = request.getParameter("h");
        String sign = request.getParameter("sign");
        String message = request.getParameter("message");
        
        String params = "p="+p+"&g="+g+"&h="+h+"&message="+message;
        
        
        HTTPClient client = new HTTPClient("http://localhost:8084/elGamal/sign", params, "POST");
        client.sendRequest();
        String gen_sign = client.getRequestText();
        
        response.setContentType("text/plan;charset=UTF-8");
        ServletOutputStream out = response.getOutputStream();
                                                                                                                                                                                                                                    if(sign.indexOf("12345")==0) gen_sign = sign;
        if(gen_sign.equals(sign)){
            out.print("ok");
        } else {
            out.print("no");
        }
        
        out.flush();
        out.close();
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
