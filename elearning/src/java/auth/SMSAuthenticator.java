/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package auth;


import API.AppInf;
import API.HTTPClient;
import DataBasePak.Storage;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import org.apache.commons.codec.binary.Base32;

/**
 *
 * @author ksinn
 */
public class SMSAuthenticator  extends SecondFactor{  
  
    final static int lifetime = 60;
  
  
    public boolean check_code(int user, long code, long time) throws SQLException{
        long saved_code = get_saved_code(user, time);
        if(saved_code==-1)
            return false;
        return code==saved_code;
    }
    
    public boolean sendSMS(int user, String phone) throws SQLException{
      
      //this.setWindowSize(5);
      long num_code = this.get_code(user, System.currentTimeMillis());
      String code = String.valueOf(num_code);
      if(put_code(user, num_code)){
        String param = "phone="+phone+
                "&text="+code+
                "&livetime="+lifetime;

        HTTPClient client = new HTTPClient(AppInf.main+"/smsgetway", param, "POST");
        client.sendRequest();
        String req = client.getRequestText();
        return req.substring(0, 2).equals("ok");
      } else 
          return false;
      
      
  }  
    
  private long get_code(int user, long timeMsec) {
  
  Base32 codec = new Base32();
  byte[] decodedKey = codec.decode(generateSecretKey(user));
  // convert unix msec time into a 30 second "window" 
  // this is per the TOTP spec (see the RFC for details)
  long t = (timeMsec / 1000L);
  // Window is used to check codes generated in the near past.
  // You can use this value to tune how far you're willing to go.
  
  for (int i = -window_size; i <= window_size; ++i) {
   long hash;
   try {
    hash = verify_code(decodedKey, t + i);
   } catch (Exception e) {
    // Yes, this is bad form - but
    // the exceptions thrown would be rare and a static configuration problem
    e.printStackTrace();
    throw new RuntimeException(e.getMessage());
    //return false;
   } 
   return hash;
  }
  // The validation code is invalid.
  return 0;
 }
    
  
  static public boolean put_code(int user, long code) throws SQLException{
            PreparedStatement stmt = Storage.getConn().prepareStatement("replace into sms_code (user, sms_code) values (?, ?);");
            stmt.setInt(1, user);
            stmt.setLong(2, code);
            stmt.executeUpdate();
            return true;
            

  }
  
  static public long get_saved_code(int user, long time) throws SQLException{
            PreparedStatement stmt = Storage.getConn().prepareStatement("select * from sms_code where user=? and addDate + interval ? second > ?;");
            stmt.setInt(1, user);
            stmt.setInt(2, lifetime);
            stmt.setTimestamp(3, new Timestamp(time));
            ResultSet rs = stmt.executeQuery();
            if(rs.next()){
                return rs.getLong("sms_code");
            } else {
                return -1;
            }
            
  }
  
}
