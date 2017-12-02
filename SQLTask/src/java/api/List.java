/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package api;

import Model.Service;
import Model.TaskList;
import com.google.gson.JsonObject;
import controll.MyServlet;
import java.io.PrintWriter;
import java.security.InvalidKeyException;
import java.security.SignatureException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.oauth.jsontoken.JsonToken;
import net.oauth.jsontoken.crypto.HmacSHA256Signer;
import org.joda.time.Instant;

/**
 *
 * @author ksinn
 */
public class List extends MyServlet {

    @Override
    protected void doMyGet(HttpServletRequest request, HttpServletResponse response) throws Exception {

    }

    @Override
    protected void doMyPost(HttpServletRequest request, HttpServletResponse response) throws Exception {

        String myURL = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
        int userid = Integer.parseInt(request.getParameter("user"));
        String anwser = request.getParameter("anwser");
        ArrayList<TaskList> list = TaskList.getByUserId(userid);

        Map<Integer, String> map = new HashMap<Integer, String>();
        Iterator<TaskList> iterator = list.iterator();
        while (iterator.hasNext()) {
            TaskList next = iterator.next();
            map.put(next.getId(), next.getName());
        }

        Service service = new Service();
        service.getById(1);

        HmacSHA256Signer signer;
        try {
            signer = new HmacSHA256Signer(myURL, null, service.getMyKey().getBytes());
        } catch (InvalidKeyException e) {
            throw new RuntimeException(e);
        }
        JsonToken token = new JsonToken(signer);
        token.setAudience(service.getURL());
        token.setIssuedAt(Instant.now());
        token.setExpiration(Instant.now().plus(60 * 1000));
        JsonObject payload = token.getPayloadAsJsonObject();
        payload.addProperty("list", map.toString());

        try {
            PrintWriter out = response.getWriter();
            out.write(token.serializeAndSign());
        } catch (SignatureException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected int PrivateMod() {
        return MyServlet.ForAll;
    }

}
