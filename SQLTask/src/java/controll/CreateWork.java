package controll;

import API.HTTPClient;
import API.WorkSWT;
import Model.Service;
import Model.Work;
import com.google.common.collect.Lists;
import com.google.gson.JsonObject;
import java.security.InvalidKeyException;
import java.security.SignatureException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.oauth.jsontoken.Checker;
import net.oauth.jsontoken.JsonToken;
import net.oauth.jsontoken.JsonTokenParser;
import net.oauth.jsontoken.crypto.HmacSHA256Verifier;
import net.oauth.jsontoken.crypto.SignatureAlgorithm;
import net.oauth.jsontoken.crypto.Verifier;
import net.oauth.jsontoken.discovery.VerifierProvider;
import net.oauth.jsontoken.discovery.VerifierProviders;

public class CreateWork extends MyServlet {

    @Override
    protected void doMyGet(HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        String myURL = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
        Service service = new Service();
        service.getById(1);
        Work work = new Work();
        WorkSWT wt = new WorkSWT(service.getServiceKey());
        if (wt.getDataFromRequest(request.getParameterMap(), work)) {
            /*
            user_id = work.getUser();
            request.getSession().setAttribute("user_id", user_id);
            User user = new User();
            user.setId(user_id);
            if(user.getUserData())
                request.getSession().setAttribute("user", user);
             */

            String WORK_KEY = request.getParameter("work_key");
            HTTPClient client = new HTTPClient(request.getParameter("Issuer") + "/api/work/get", "work_key=" + request.getParameter("work_key"), "POST");
            client.sendRequest();

            //WorkJWT tok = new WorkJWT();
            JsonToken token = pars(client.getRequestText());

            //if (tok.getData(client.getRequestText(), work, AppInf.main)) {
            if (token.getAudience().equals(myURL) && token.getExpiration().getMillis() > System.currentTimeMillis()) {
                if (token.getParamAsPrimitive("status").getAsInt() == 200) {
                    //if (user_id == work.getUser()) {
                    if (!work.isExistKey()) {
                        work.setCount(token.getParamAsPrimitive("count").getAsInt());
                        work.setList(token.getParamAsPrimitive("list").getAsInt());
                        work.setWorkKey(token.getParamAsPrimitive("work_key").getAsString());
                        work.setUser(token.getParamAsPrimitive("user_id").getAsInt(), token.getIssuer());
                        if (work.Write()) {
                            throw new Exception("Error writing");
                        }
                    }
                    request.getSession().setAttribute("work_id", work.getId());
                    response.sendRedirect("NextTask");

                    //}
                } else {
                    throw new Exception(token.getParamAsPrimitive("errorMessage").getAsString());
                }

            } else {
                throw new Exception("Uncorect link");
            }
            //request.setAttribute("WORK_KEY", request.getParameter("work_key"));
            //request.getRequestDispatcher("StartWork.jsp").forward(request, response);
        }
    }

    @Override
    protected void doMyPost(HttpServletRequest request, HttpServletResponse response)
            throws Exception {

    }

    @Override
    protected int PrivateMod() {
        return MyServlet.ForAll;
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
