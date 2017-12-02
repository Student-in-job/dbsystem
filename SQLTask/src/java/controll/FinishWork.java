package controll;

import API.HTTPClient;
import Model.Service;
import Model.Work;
import com.google.common.collect.Lists;
import com.google.gson.JsonObject;
import java.security.InvalidKeyException;
import java.security.SignatureException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.oauth.jsontoken.Checker;
import net.oauth.jsontoken.JsonToken;
import net.oauth.jsontoken.JsonTokenParser;
import net.oauth.jsontoken.crypto.HmacSHA256Signer;
import net.oauth.jsontoken.crypto.HmacSHA256Verifier;
import net.oauth.jsontoken.crypto.SignatureAlgorithm;
import net.oauth.jsontoken.crypto.Verifier;
import net.oauth.jsontoken.discovery.VerifierProvider;
import net.oauth.jsontoken.discovery.VerifierProviders;
import org.joda.time.Instant;

public class FinishWork extends MyServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        String myURL = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
        Service service = new Service();
        service.getById(1);

        String error = "";
        Integer work_id = (Integer) request.getSession().getAttribute("work_id");
        Work work = new Work();
        try {
            /*if (work_id == null) {
                HashMap<String, Object> param = new HashMap<String, Object>();
                param.put("user_id", user_id);
                param.put("Date(times)", "Date(now())");

                ArrayList<HashMap<String, Object>> Params = work.getObjectsParam(param);
                if (!Params.isEmpty()) {
                    work = new Work();
                    work.getFromParam(Params.get(0));
                    work.ReadAcceptsFromDB();
                    work.ReadTaskList();
                }
            } else {*/
                work = new Work(work_id);
            //}

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
            payload.addProperty("work_key", work.getWorkKey());
            payload.addProperty("mark", work.getMark());
            HTTPClient client = new HTTPClient(service.getMarkURL(), token.serializeAndSign(), "POST");
            client.sendRequest();
            error = "Error whith connect. Sed to you teach.";
            if(client.getRequestText()!=null){
                token = pars(client.getRequestText());
                if (token.getParamAsPrimitive("status").getAsInt() != 200) {
                    error = "";
                }
            }
        } catch (Exception ex) {
            throw new ServletException(ex);
        }
        request.setAttribute("error", error);
        request.getRequestDispatcher("FinishTask.jsp").forward(request, response);

    }

    @Override
    protected void doMyGet(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        processRequest(request, response);
    }

    @Override
    protected void doMyPost(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        processRequest(request, response);
    }

    @Override
    protected int PrivateMod() {
        return MyServlet.ForAll;//OnlyForAuthorized;
    }

    private JsonToken pars(String token) throws Exception {
        try {
            Service service = new Service();
            service.getById(1);
            final Verifier hmacVerifier = new HmacSHA256Verifier(service.getServiceKey().getBytes());

            VerifierProvider hmacLocator = new VerifierProvider() {

                @Override
                public List<Verifier> findVerifier(String id, String key) {
                    return Lists.newArrayList(hmacVerifier);
                }
            };
            VerifierProviders locators = new VerifierProviders();
            locators.setVerifierProvider(SignatureAlgorithm.HS256, hmacLocator);
            net.oauth.jsontoken.Checker checker = new Checker() {

                @Override
                public void check(JsonObject payload) throws SignatureException {
                    // don't throw - allow anything
                }

            };
            //Ignore Audience does not mean that the Signature is ignored
            JsonTokenParser parser = new JsonTokenParser(locators, checker);
            JsonToken jt;
            try {
                jt = parser.verifyAndDeserialize(token);
                return jt;
            } catch (SignatureException e) {
                throw new RuntimeException(e);
            }

        } catch (InvalidKeyException e1) {
            throw new RuntimeException(e1);
        }
    }

}
