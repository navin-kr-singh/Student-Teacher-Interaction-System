package sti.classes;

import java.io.Serializable;

public class Membership implements Serializable
{
   private String groupid, groupname, memberid, membername;
   
   public Membership()
   {
       groupid = " ";
       memberid = " ";
       membername = " ";
       groupname = " ";
   }
   
   public Membership(String group_id, String group_name, String member_id, String member_name)
   {
       this.groupid = group_id;
       this.groupname = group_name;
       this.memberid = member_id;
       this.membername = member_name;
   }
   
   public void setGroupId(String group_id)
   {
       this.groupid = group_id;
   }
   
   public String getGroupId()
   {
       return this.groupid;
   }
   
   public void setGroupName(String group_name)
   {
       this.groupname = group_name;
   }
   
   public String getGroupName()
   {
       return this.groupname;
   }
   
   public void setMemberId(String member_id)
   {
       this.memberid = member_id;
   }
   
   public String getMemberId()
   {
       return this.memberid;
   }
   public void setMemberName(String member_name)
   {
       this.membername = member_name;
   }
   
   public String getMemberName()
   {
       return this.membername;
   }
}

