/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package API;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author ksinn
 */
public class HTTPClient {
    
    private String Response;
    private String Addres;
    private String Param;
    private String Method;
    
    public HTTPClient(String addres, String param, String method){
        this.Addres = addres;
        this.Method = method;
        this.Param = param;
    }
    
    public void sendRequest(){
        HttpURLConnection connection = null;  
        try {
              //Create connection
              URL url = new URL(Addres);
              connection = (HttpURLConnection)url.openConnection();
              connection.setRequestMethod(Method);
              connection.setRequestProperty("Content-Type", 
                   "application/x-www-form-urlencoded");

              connection.setRequestProperty("Content-Length", "" + 
                       Integer.toString(Param.getBytes().length));
              connection.setRequestProperty("Content-Language", "en-US");  

              connection.setUseCaches (false);
              connection.setDoInput(true);
              connection.setDoOutput(true);

              //Send request
              DataOutputStream wr = new DataOutputStream (
                          connection.getOutputStream ());
              wr.writeBytes (Param);
              wr.flush ();
              wr.close ();

              //Get Response	
              InputStream is = connection.getInputStream();
              BufferedReader rd = new BufferedReader(new InputStreamReader(is));
              String line;
              StringBuffer resp = new StringBuffer(); 
              while((line = rd.readLine()) != null) {
                resp.append(line);
                resp.append('\r');
              }
              rd.close();
              Response = resp.toString();

        } catch (Exception e) {

        } finally {

              if(connection != null) {
                connection.disconnect(); 
               }
        }
    }
    
    public String getRequestText(){
        return this.Response;
    }
    
    public JSONObject getRequestJSON() throws JSONException{
        return new JSONObject(this.Response);
    }
    
}
