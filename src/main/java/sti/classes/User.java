package sti.classes;

import java.io.Serializable;

public class User implements Serializable
{
    private String id, password, type;
    
    public User()
    {
        id = " ";
        password = " ";
        type = " ";
    }
    
    public User(String user_id, String user_password, String user_type)
    {
        this.id = user_id;
        this.password = user_password;
        this.type = user_type;
    }
    
    public void setId(String user_id)
    {
        this.id = user_id;
    }
    
    public String getId()
    {
        return this.id;
    }
    
    public void setPassword(String user_password)
    {
        this.password = user_password;
    }
    
    public String getPassword()
    {
        return this.password;
    }
    
    public void setType(String user_type)
    {
        this.type = user_type;
    }
    
    public String getType()
    {
        return this.type;
    }
}
