/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import elgamal.CipherText;
import elgamal.Elgamal;
import elgamal.KeySet;
import elgamal.PublicKey;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.util.Arrays;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import static jdk.nashorn.internal.objects.ArrayBufferView.buffer;
import org.apache.commons.codec.binary.Base32;

/**
 *
 * @author ksinn
 */
public class Sign extends HttpServlet {


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
        BigInteger p = new BigInteger(request.getParameter("p"));
        BigInteger g = new BigInteger(request.getParameter("g"));
        BigInteger h = new BigInteger(request.getParameter("h"));
        String message = request.getParameter("message");
        
        KeySet keys = new KeySet(new PublicKey(p,h,g), null,256);
        
        Elgamal eg = new Elgamal(keys, 256);
        
        CipherText encrypt = eg.encrypt(message);
        String sign = eg.PtToString(encrypt.getCt());
        
        Base32 codec = new Base32();
        byte[] bEncodedKey = codec.encode(sign.getBytes("UTF-8"));
        String encodedSign = new String(bEncodedKey);
        
        response.setContentType("text/plan;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.print(encodedSign);
        //out.flush();
        //out.close();
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
