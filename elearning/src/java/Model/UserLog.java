/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.SQLException;
import java.util.HashMap;
import javax.naming.NamingException;

/**
 *
 * @author ksinn
 */
public class UserLog extends Parent{

    private String User;
    private int Result;
    private String Factor;
    private String Mods; 
    
    private UserLog(){}
    
    static public UserLog inSMS(String user){
        UserLog res = new UserLog();
        res.User = user;
        res.Mods = "i";
        res.Factor="phone";
        return  res;
    }
    
    static public UserLog inKey(String user){
        UserLog res = new UserLog();
        res.User = user;
        res.Mods = "i";
        res.Factor="key";
        return  res;
    }
    
    static public UserLog out(String user){
        UserLog res = new UserLog();
        res.User = user;
        res.Mods = "o";
        res.Factor=null;
        return  res;
    }
    
    public boolean Write(int res) throws NamingException, SQLException{
        this.Result = res;
        return this._insert();
    }

    @Override
    public boolean MayChange() {
        return false;
    }

    @Override
    protected HashMap<String, Object> _getParams() {
        HashMap<String, Object> list = new HashMap<String, Object>();
        list.put("user", this.User);
        list.put("result", this.Result);
        list.put("mods", this.Mods);
        list.put("factor", this.Factor);
        return list;
    }

    @Override
    protected void _setParams(HashMap<String, Object> Params) throws Exception {
        this.User = (String) Params.get("user");
        this.Result = (int) Params.get("result");
        this.Mods = (String) Params.get("mods");
        this.Factor = (String) Params.get("factor");
    }

    @Override
    public String _getType() {
        return "auth";
    }

    @Override
    protected boolean _isCorrect() {
        return true;
    }
    
}
