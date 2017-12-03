package controll;

import API.HTTPClient;
import Impl.WorkEntety;
import Struct.JWTHelper;
import static Struct.TasKer.getListFactory;
import Struct.Work;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.oauth.jsontoken.JsonToken;

public class CreateWork extends MyServlet {

    @Override
    protected void doMyGet(HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        JsonToken iToken = JWTHelper.parsJWT(request.getParameter("t"));
        if (JWTHelper.check(iToken, extractURL(request))) {
            String WORK_KEY = iToken.getParamAsPrimitive("work_key").getAsString();
            HTTPClient client = new HTTPClient(iToken.getIssuer() + "/api/work/get", "work_key=" + WORK_KEY, "POST");
            client.sendRequest();
            JsonToken token = JWTHelper.parsJWT(client.getRequestText());
            if (JWTHelper.check(token, extractURL(request))) {
                if (token.getParamAsPrimitive("status").getAsInt() == 200) {
                    Work work = new WorkEntety();
                    if (!work.getByKey(WORK_KEY)) {
                        work.setCount(token.getParamAsPrimitive("count").getAsInt());
                        work.setList(getListFactory().createById(token.getParamAsPrimitive("list").getAsInt()));
                        work.setKeyFromString(token.getParamAsPrimitive("work_key").getAsString());
                        work.setUserId(token.getParamAsPrimitive("user_id").getAsInt());
                        if (!work.save()) {
                            throw new Exception("Error writing");
                        }
                    }
                    request.getSession().setAttribute("work_id", work.getId());
                    response.sendRedirect("NextTask");
                    return;
                } else {
                    throw new Exception(token.getParamAsPrimitive("errorMessage").getAsString());
                }
            }}

            throw new Exception("Uncorect link");

        }

        @Override
        protected void doMyPost
        (HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        }

        @Override
        protected int PrivateMod
        
            () {
        return MyServlet.ForAll;
        }

    }
