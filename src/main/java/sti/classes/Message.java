package sti.classes;

import java.io.Serializable;

public class Message implements Serializable
{
    private String groupid, senderid, sendername, content;
    
    public Message()
    {
        content = " ";
        senderid = " ";
        groupid = " ";
        sendername = " ";
    }
    
    public Message(String group_id, String sender_id, String sender_name, String msg)
    {        
        this.groupid = group_id;       
        this.senderid = sender_id;
        this.sendername = sender_name;
        this.content = msg;
    }
    
    public void setContent(String msg)
    {
        this.content = msg;
    }
    
    public String getContent()
    {
        return this.content;
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
