package sti.classes;

import java.io.Serializable;

public class Group implements Serializable 
{
    private String name, ownerid;
    
    public Group()
    {
        name  = " ";
        ownerid = " ";
    }
    
    public Group(String group_name, String owner_id)
    {
        this.name = group_name;
        this.ownerid = owner_id;
    }
    
    public void setName(String group_name)
    {
        this.name = group_name;
    }
    
    public String getName()
    {
        return this.name;
    }
    
    public void setOwnerId(String owner_id)
    {
        this.ownerid = owner_id;
    }
    
    public String getOwnerId()
    {
        return this.ownerid;
    }
}
