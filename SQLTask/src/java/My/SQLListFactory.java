/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package My;

import Struct.ListFactory;
import Struct.ErrorParameterException;
import Struct.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author ksinn
 */
public class SQLListFactory implements ListFactory{

    @Override
    public List create(HttpServletRequest request) throws ErrorParameterException {

        SQLTaskList list = new SQLTaskList();
        
        Map<String, String[]> request_params = request.getParameterMap();
        
        String schema = null;
        int user_id = 0;
        String name = request_params.getOrDefault("name", new String[]{"unnamed"})[0];
        String publish = request_params.getOrDefault("publish", new String[]{"0"})[0];
        String[] schemaAr = request_params.get("schema");
        

        ErrorParameterException exp = null;
        if (schemaAr != null) {
            schema = schemaAr[0];
        } else {
            exp = new ErrorParameterException("Miss parameter 'schema'");
        }
        if (request.getSession().getAttribute("user_id") != null) {
            try {
                user_id = (int) request.getSession().getAttribute("user_id");
            } catch (Exception ex) {
                exp = new ErrorParameterException("Error value of parameter 'user_id'");
            }
        } else {
            exp = new ErrorParameterException("Miss parameter 'user_id'");
        }

        if (exp == null) {
            list.setUserId(user_id);
            list.setName(name);
            list.setSchema(schema);
            list.setPublish("1".equals(publish));
            return list;
        } else {
            throw exp;
        }

    }

    @Override
    public List create() {
        return new SQLTaskList();
    }

    @Override
    public List createById(int id) throws Exception {
        SQLTaskList list = new SQLTaskList();
        list.getById(id);
        return list;
    }

    @Override
    public List create(HttpServletRequest request, List l) throws ErrorParameterException {

        SQLTaskList list = (SQLTaskList) l;
        
        Map<String, String[]> request_params = request.getParameterMap();

        String schema = request_params.getOrDefault("schema", new String[]{list.getSchema()})[0];
        String name = request_params.getOrDefault("name", new String[]{list.getName()})[0];
        String publish = request_params.getOrDefault("publish", new String[]{list.isPublish()?"1":"0"})[0];

        list.setName(name);
        list.setPublish("1".equals(publish));
        return list;
    }

}
