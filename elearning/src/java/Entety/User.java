package Entety;

import java.util.ArrayList;
import java.util.HashMap;
import java.sql.SQLException;
import javax.naming.NamingException;

/**
 *
 * @author ksinn
 */
public class User extends Parent implements API.User {

    protected String Mail;
    protected String Name;
    protected String Surname;
    protected boolean Logined;

    @Override
    public String _getType() {
        return "user";
    }

    @Override
    public boolean MayChange() {
        return true;
    }

    @Override
    protected HashMap<String, Object> _getParams() {

        HashMap<String, Object> list = new HashMap<String, Object>();
        list.put("name", this.Name);
        list.put("surname", this.Surname);
        list.put("mail", this.Mail);
        return list;

    }

    @Override
    protected void _setParams(HashMap<String, Object> Params) throws Exception {

        this.Name = (String) Params.get("name");
        this.Surname = (String) Params.get("surname");
        this.Mail = (String) Params.get("mail");

    }

    @Override
    protected boolean _isCorrect() {

        return true;

    }

    public User() {
        this.Logined = false;
    }

    public void getById(int id) throws Exception {
        if (id > 0) {
            this.ID = id;
            this._select();
        } else {
            throw new Exception("Invalid input data for user with id=" + id);
        }
    }

    public boolean getByMail(String mail) throws Exception {

        HashMap<String, Object> param = new HashMap<String, Object>();
        param.put("mail", mail);

        ArrayList<HashMap<String, Object>> Params = this.getObjectsParam(param);
        for (int i = 0; i < 1; i++) {
            this.getFromParam(Params.get(i));
        }

        this._from_db = true;

        return this._isCorrect();
    }

    @Override
    public String getMail() {
        return Mail;
    }

    public boolean isLogined() {
        return this.Logined;
    }

    @Override
    public String getName() {
        return this.Name;
    }

    @Override
    public String getSurname() {
        return this.Surname;
    }

    @Override
    public int getId() {
        return this.ID;
    }

    @Override
    public void setId(int data) {
    }

    @Override
    public void setMail(String data) {
        this._from_db = false;
        this.Mail = data;
    }

    @Override
    public void setName(String data) {
        this._from_db = false;
        this.Name = data;
    }

    @Override
    public void setSurname(String data) {
        this._from_db = false;
        this.Surname = data;
    }

    public void setLogined(boolean l) {
        this.Logined = l;
    }

    public boolean Update() throws NamingException, SQLException {
        return this._update();
    }

    public boolean Write() throws Exception {
        if (ID == 0) {
            return this._insert();
        } else {
            return false;
        }
    }

}
