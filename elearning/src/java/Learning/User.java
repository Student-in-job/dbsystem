package Learning;

import API.AppInf;
import Staff.Storage;  
import java.io.File;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import javax.servlet.http.Part;
import auth.GoogleAuthenticator;
import auth.SMSAuthenticator;
import auth.SecondFactor;
import auth.Secret;
import java.sql.SQLException;
import javax.naming.NamingException;


/**
 *
 * @author ksinn
 */
public class User extends Parent implements API.User{

    protected String Mail;
    protected String Name;
    protected String Surname;
    protected String Gender;
    protected boolean Logined;
    protected Date DateRegestration;
    
    @Override
    public String _getType(){
        return "user";
    }
    
    @Override
    public boolean MayChange(){
        return true;
    }
    
    @Override
    protected HashMap<String, Object> _getParams() {
        
        HashMap<String, Object> list = new HashMap<String, Object>();
        list.put("name", this.Name);
        list.put("surname", this.Surname);
        list.put("gender", this.Gender);
        list.put("mail", this.Mail);
        return list;
        
    }

    @Override
    protected void _setParams(HashMap<String, Object> Params) throws Exception {
        
        this.Name = (String) Params.get("name");
        this.Surname = (String) Params.get("surname");
        this.Gender = (String) Params.get("gender");
        this.Mail = (String) Params.get("mail");
        
    }

    @Override
    protected boolean _isCorrect() {
        
        return true;
    
    }
    
    public void getById(int id) throws Exception{
        if(id>0){
            this.ID = id;
            this._select();
        } else 
            throw new Exception("Invalid input data!");
    }
    
    public User(){
        this.Logined = false;
    }
    
    public boolean Change(String password, String mail, String new_password, String name, String surname, Date birthday, String gender, Part part) throws Exception
    {
        if(!Logined) throw new Exception("Illegal Action! Only logined user can cange user data.");
        return this._update();
    }
    
    public boolean SaveIco(Part part) throws Exception{
        if(part.getSize()!=0){
            IcoFile file = new IcoFile(part, this);
            return file.SaveFile();
        }  else 
            throw new Exception("Invalid input data!");
    }
    
    public boolean Register() throws Exception
    {
        if(ID==0){
            return this._insert();
        } else 
            throw new Exception("Invalid input data!");
    }
    
    public boolean getByMail(String mail) throws Exception{
        
        HashMap<String, Object> param = new HashMap<String, Object>();
        param.put("mail", mail);
        
        ArrayList<HashMap<String, Object>> Params = this.getObjectsParam(param);
        for(int i=0; i<1; i++){
            this.getFromParam(Params.get(i));
        }
        
        this._from_db=true;
        
        return this._isCorrect();
    }
    
    public boolean LogIn(long code, long t) throws Exception{
        if(this._from_db){
            if(SecondFactor.get2factor(this.ID, "phone")!=null);
                 SMSAuthenticator sa = new SMSAuthenticator();  
                 this.Logined = sa.check_code(this.ID, code, t);

                 if(!this.Logined){
                    Secret secret= SecondFactor.get2factor(ID, "key");
                    GoogleAuthenticator ga = new GoogleAuthenticator();
                    //ga.setWindowSize(0); 
                    this.Logined = ga.check_code(secret.Secret, code, t);
                 }
        }
        return this.Logined;
    }
    
    public boolean hasSecondFactor() throws SQLException, NamingException{
        return null != SecondFactor.get2factor(this.ID, "key");
    }
    
    public String setSecretKey() throws SQLException, NamingException{
        String secretKey = GoogleAuthenticator.generateSecretKey(this.ID);
         
         Secret key = new Secret();
         key.Secret = secretKey;
         key.Type = "key";
         
         if(GoogleAuthenticator.put2factor(this.ID, key))
            return "otpauth://totp/"+AppInf.main+"?secret="+secretKey;
         else return null;
    }
    
    public void LogOut(){
        
    }
    
    @Override
    public String getMail() {
        return Mail;
    }
    
    public Date getDateRegestration() {
        return DateRegestration;
    }

    public String getGender() {
        return Gender;
    }
    
    public String getGenderString() {
        return Gender.equals("w")?"Women":"Men";
    }
    
    public boolean isLogined()
    {
        return this.Logined;
    }
    
    @Override
    public String getName()
    {
        return this.Name;
    }
    
    @Override
    public String getSurname()
    {
        return this.Surname;
    }
    
    @Override
    public String getIco(){
        
        String path = Storage.getFileDir() + this._getType() + "/" +String.valueOf(ID)+".png";
        if(new File(Storage.getRealPath()+path).exists())
            return Storage.getFileDir() + this._getType() + "/" +String.valueOf(ID)+".png";
        else return "img/default_user_"+this.getGender()+".png";
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
        this.Mail = data;
    }

    @Override
    public void setName(String data) {
        this.Name = data;
    }

    @Override
    public void setSurname(String data) {
        this.Surname = data;
    }
    
    public void setGender(String data) {
        this.Gender = data;
    }

    @Override
    public void setIco(String data) {
    
    }

    
}
