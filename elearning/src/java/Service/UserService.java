/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Service;

import Auth.GoogleAuthenticator;
import Auth.SMSAuthenticator;
import Auth.SecondFactor;
import Auth.Secret;
import Entety.User;
import java.sql.SQLException;
import javax.naming.NamingException;

/**
 *
 * @author ksinn
 */
public class UserService {

    /**
     * 
     * @param user
     * @param code
     * @param t
     * @param print
     * @return
     * @throws Exception 
     */
    public boolean LogIn(User user, long code, long t, String print) throws Exception {
        Secret secret = SecondFactor.get2factor(user.getId());
        boolean l = false;
        if (secret != null) {
            switch (secret.Type) {
                case "key": {
                    GoogleAuthenticator ga = new GoogleAuthenticator();
                    l = ga.check_code(secret.Secret, code, t);
                    break;
                }
                case "phone": {
                    SMSAuthenticator sa = new SMSAuthenticator();
                    l = sa.check_code(user.getId(), code, t);
                    break;
                }
            }
        }
        user.setLogined(l);
        return l;
    }
    
    
    /**
     * 
     * @param user
     * @throws NamingException
     * @throws SQLException 
     */
    public void LogOut(User user) throws NamingException, SQLException {
        
    }
    
    /**
     * 
     * @param user
     * @return
     * @throws SQLException
     * @throws NamingException 
     */
    public boolean hasSecondFactor(User user) throws SQLException, NamingException {
        return null != SecondFactor.get2factor(user.getId());
    }

    
    /**
     * 
     * @param user
     * @return
     * @throws SQLException
     * @throws NamingException 
     */
    public Secret getSecondFactor(User user) throws SQLException, NamingException {
        return SecondFactor.get2factor(user.getId());
    }

    /**
     * 
     * @param user
     * @return
     * @throws SQLException
     * @throws NamingException 
     */
    public String setSecretKey(User user) throws SQLException, NamingException {

        Secret key = new Secret();
        key.Secret = GoogleAuthenticator.generateSecretKey(user.getId());
        key.Type = "key";

        if (GoogleAuthenticator.put2factor(user.getId(), key)) {
            return "otpauth://totp/tomcat.cyberforum.uz:elearning?secret=" + key.Secret
                    + "&issuer=tomcat.cyberforum.uz"
                    + "&algorithm=sha1"
                    + "&period=30";
        } else {
            return null;
        }
    }
    
    /**
     * 
     * @param user
     * @return
     * @throws Exception 
     */
    public boolean Register(User user) throws Exception {
        if (user.getId() == 0) {
            return user.Write();
        } else {
            return false;
        }
    }

}
