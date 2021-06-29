package sti.classes;

import java.io.Serializable;

public class Files implements Serializable
{
    private String filename, groupid, senderid, sendername;
    
    public Files()
    {
        filename = " ";
        senderid = " ";
        groupid = " ";
        sendername = " ";
    }
    
    public Files(String file_name, String sender_id, String group_id, String sender_name)
    {
        this.filename = file_name;
        this.senderid = sender_id;
        this.groupid = group_id;
        this.sendername = sender_name;
    }
    
     public void setFileName(String file_name)
    {
        this.filename = file_name;
    }
    
    public String getFileName()
    {
        return this.filename;
    }
    
    public void setSenderId(String sender_id)
    {
        this.senderid = sender_id;
    }
    
    public String getSenderId()
    {
        return this.senderid;
    }  
    
    public void setGroupId(String group_id)
    {
        this.groupid = group_id;
    }
    
    public String getGroupId()
    {
        return this.groupid;
    } 
    
    public void setSenderName(String sender_name)
    {
        this.sendername = sender_name;
    }
    
    public String getSenderName()
    {
        return this.sendername;
    } 
}
