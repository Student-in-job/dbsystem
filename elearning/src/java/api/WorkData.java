/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package api;

import Entety.Work;
import com.google.gson.JsonObject;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.InvalidKeyException;
import java.security.SignatureException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.oauth.jsontoken.JsonToken;
import net.oauth.jsontoken.crypto.HmacSHA256Signer;
import org.joda.time.Instant;

/**
 *
 * @author ksinn
 */
public class WorkData extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String myURL = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();

            Work work = new Work();
            work.setWorkKey(request.getParameter("work_key"));
            work.getByKey();

            HmacSHA256Signer signer;
            try {
                signer = new HmacSHA256Signer(myURL, null, work.getTask().getService().getMyKey().getBytes());
            } catch (InvalidKeyException e) {
                throw new RuntimeException(e);
            }
            JsonToken token = new JsonToken(signer);
            token.setAudience(work.getTask().getService().getURL());
            token.setIssuedAt(Instant.now());
            token.setExpiration(Instant.now().plus(60 * 1000));
            JsonObject payload = token.getPayloadAsJsonObject();

            if (work.isAlive()) {
                payload.addProperty("status", "200");
                payload.addProperty("count", work.getCount());
                payload.addProperty("list", work.getListId());
                payload.addProperty("work_key", work.getWorkKey());
                payload.addProperty("user_id", work.getUser());
            } else {
                payload.addProperty("status", "401");
                payload.addProperty("errorMessage", "Work time is ended");
            }
            try {
                PrintWriter out = response.getWriter();
                out.write(token.serializeAndSign());
            } catch (SignatureException e) {
                throw new RuntimeException(e);
            }

            //WorkJWT wt = new WorkJWT();
            //String res = wt.getJson(accept, AppInf.main);
        } catch (Exception ex) {
            throw new ServletException(ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
