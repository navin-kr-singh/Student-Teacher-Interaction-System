package sti.DatabaseOperations;

import java.sql.*;
import sti.classes.*;

public class Database 
{
    private String query;
    private Connection con;
    private Statement st;
    private ResultSet rs;
    
    public Database()
    {
        this.query = " ";
        this.rs = null;
        try
        {
            //get the connection to the database
            this.con = DriverManager.getConnection("jdbc:mysql://localhost:3306/STI", "root", "1234");
            this.st = con.createStatement();
        }
        catch(SQLException se)
        {
            System.out.println(se); 
            System.out.println("DATABASE constructor: could not get the connection");
        }
    }
    
    public int CreateRecord(Group grp)
    {   //create record of a group
        query = "INSERT INTO Groups(name, ownerid) VALUES('"+grp.getName()+"', '"+grp.getOwnerId()+"');";   
        try
        {
            return st.executeUpdate(query);
        }
        catch(SQLException se)
        {
            System.out.println(se);
            System.out.println("DATABASE class: create group record class - could crete the group record");
            return 0;
        }
    }
    
    public int CreateRecord(Membership mbp)
    {   //create record of a membership        
        try
        {
            rs = RetrieveUser(mbp.getMemberId(), "Student");
            if(rs.next()&& rs.getString("name").equalsIgnoreCase(mbp.getMemberName())) //if the student exists
            {
                query = "INSERT INTO Membership VALUES('"+mbp.getGroupId()+"', '"+mbp.getGroupName()+"', '"+mbp.getMemberId()+"', '"+mbp.getMemberName()+"');"; 
                return st.executeUpdate(query);
            }
            else
                return 0;
        }
        catch(SQLException se)
        {
            System.out.println(se);
            System.out.println("Database class: createmembership record method-error");
            return 0;
        }
    }
    
    public int CreateRecord(Message msg)
    {   //create record of a message
        query = "INSERT INTO Message(groupid, senderid, sendername, content) VALUES(?, ?, ?, ?);";        
        try
        {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, msg.getGroupId());
            ps.setString(2, msg.getSenderId());
            ps.setString(3, msg.getSenderName());
            ps.setString(4, msg.getContent());
            return ps.executeUpdate();
        }
        catch(SQLException se)
        {
            System.out.println(se);
            return 0;
        }
    }
    
    public int CreateRecord(Files file)
    {   //create record of a file
        PreparedStatement ps = null;
        try
        {
            query = "SELECT senderid FROM Files where groupid = '"+file.getGroupId()+"' AND filename = '"+file.getFileName()+"';";
            rs = st.executeQuery(query);
            if(rs.next()) //if the file exists
            {
                return 0;
            }
            else
            {         
                query = "INSERT INTO Files(filename, groupid, senderid, sendername) VALUES(?, ?, ?, ?);";
                ps = con.prepareStatement(query);
                ps.setString(1, file.getFileName());
                ps.setString(2, file.getGroupId());
                ps.setString(3, file.getSenderId());
                ps.setString(4, file.getSenderName());
                int row = ps.executeUpdate();
                return row;
                
            }
        }
        catch(SQLException se)
        {
            System.out.println(se);
            System.out.println("Database class: create file record method - error");
            return 0;
        }
        finally
        {
            DatabaseUtil.closeStatement(ps);
        }
    }
    
    
    public ResultSet RetrieveUser(String id, String type)
    {   //obtain record of a user using his id and type
        query = "SELECT * FROM "+type+" WHERE id = '"+id+"';";
        try
        {
            rs = st.executeQuery(query);
        }
        catch(SQLException se)
        {
            System.out.println(se);
            rs = null;
        }
        return rs;
    }
    
     public ResultSet Retrievegroups(String ownerid)
    {   //obtain the groups created by a teacher using his id
        query = "SELECT * FROM Groups WHERE ownerid = '"+ownerid+"';";
        try
        {
            rs = st.executeQuery(query);
        }
        catch(SQLException se)
        {
            System.out.println(se);
            rs = null;
        }
        return rs;
    }
     
     public ResultSet RetrieveGroup(String groupid)
    {   //obtain record of a group using groupid
        query = "SELECT * FROM Groups WHERE id = '"+groupid+"';";
        try
        {
            rs = st.executeQuery(query);
        }
        catch(SQLException se)
        {
            System.out.println(se);
            System.out.println("database class: RetrieveGroup method-error");
            rs = null;
        }
        return rs;
    }
    

    public ResultSet RetrieveFile(String id)
    {   //obtain record of a file using its fileid
        query = "SELECT * FROM Files WHERE id = '"+id+"';";
        try
        {
            rs = st.executeQuery(query);
            return rs;
        }
        catch(SQLException se)
        {
            System.out.println(se);
            return null;
        }
    }
    
    public ResultSet RetrieveMemberships(String memberid)
    {   //obtain the id of the groups of a user using his userid
        query = "SELECT * FROM Membership WHERE memberid = '"+memberid+"';";
        try
        {
            rs = st.executeQuery(query);
        }
        catch(SQLException se)
        {
            System.out.println(se);
            rs = null;
        }  
        return rs;
    }
    
    public ResultSet RetrieveGroupMembers(String groupid)
    {   //obtain the id of the users of a group using groupid
        query = "SELECT * FROM Membership WHERE groupid = '"+groupid+"';";
        try
        {
            rs = st.executeQuery(query);
            return rs;
        }
        catch(SQLException se)
        {
            System.out.println(se);
            return null;
        }
    }
    
    
    
    public ResultSet RetrieveGroupFiles(String groupid)
    {   //obtain the details of the files in a group using the groupid
        query = "SELECT id, filename FROM Files WHERE groupid = '"+groupid+"';";
        try
        {
            rs = st.executeQuery(query);
            return rs;
        }
        catch(SQLException se)
        {
            System.out.println(se);
            return null;
        }
    }
    
    public ResultSet RetrieveGroupMessages(String groupid)
    {   //obtain the details of the messages in a group using the groupid
        query = "SELECT * FROM Message WHERE groupid = '"+groupid+"' ORDER BY id DESC;";
        try
        {
            rs = st.executeQuery(query);
            return rs;
        }
        catch(SQLException se)
        {
            System.out.println(se);
            System.out.println("Database class: retrieve messages method - error");
            return null;
        } 

    }
    
    public ResultSet SearchGroupMembers(String groupid, String memberinfo)
    {   //search a member using in a group using groupid and member name or member id
        query = "SELECT * FROM Membership WHERE groupid = '"+groupid+"' AND (memberid = '"+memberinfo+"' OR membername = '"+memberinfo+"');";
        try
        {
            rs = st.executeQuery(query);
            return rs;
        }
        catch(SQLException se)
        {
            System.out.println(se);
            System.out.println("Dataabse class: memebers cannot be searched");
            return null;
        } 
    }
    
    public int UpdatePassword(User user, String newpassword)
    {
        try
        {
            if(isUserValid(user))
            {
                query = "UPDATE "+user.getType()+" SET password = '"+newpassword+"' WHERE id = '"+user.getId()+"';";
                return st.executeUpdate(query);
            }
        }
        catch(SQLException se)
        {
            System.out.println(se);
            System.out.println("database class: update password method-could not update password");
            return 0;
        }
        return 0;
    }
    
    
    public int DeleteMember(Membership mbp)
    {
        try
        {
            rs = SearchGroupMembers(mbp.getGroupId(), mbp.getMemberId());
            if(rs.next()&& rs.getString("membername").equalsIgnoreCase(mbp.getMemberName())) // if the member exists
            {
                query = "DELETE FROM Membership WHERE groupid = '"+mbp.getGroupId()+"' AND memberid = '"+mbp.getMemberId()+"';";
                return st.executeUpdate(query);
            }
        }
        catch(SQLException ce)
        {
            System.out.println(ce);
            System.out.println("database class:  delete member method-could not delete member");
            return 0;
        }
        return 0;
    }
    
    public ResultSet getGroupOwner(String groupid)
    {
        query = "SELECT ownerid FROM Groups WHERE id = '"+groupid+"';";
        try
        {
            rs = st.executeQuery(query);
            rs.next();
            String ownerid = rs.getString("ownerid");
            System.out.println("database class: getgroupowner method- group owner id retrieved");
            query = "SELECT * FROM Teacher WHERE id = '"+ownerid+"';";
            rs = st.executeQuery(query);
            return rs;
        }
        catch(SQLException se)
        {
            System.out.println(se);
            System.out.println("database class: getgroupowner method-cannot get group owner details");
            return null;
        }
    }
    
    public ResultSet RetrieveLastGroupid(String ownerid)
    {
        query = "SELECT MAX(id) AS id FROM Groups WHERE ownerid  = '"+ownerid+"';";
        try
        {
            rs = st.executeQuery(query);
            return rs;
        }
        catch(SQLException se)
        {
            System.out.println(se);
            System.out.println("database class: getlastgroup method-cannot get last group");
            return null;
        }
    }
    
    
    public int DeleteGroup(String groupid)
    {
        query = "DELETE FROM Membership WHERE groupid = '"+groupid+"';";
        try
        {
            st.executeUpdate(query);
            System.out.println("database class: delete group method - memberships deleted");
            query = "DELETE FROM Files WHERE groupid = '"+groupid+"';";
            st.executeUpdate(query);
            System.out.println("database class: delete group method - files deleted");
            query = "DELETE FROM Message WHERE groupid = '"+groupid+"';";
            st.executeUpdate(query);
            System.out.println("database class: delete group method - messages deleted");
            query = "DELETE FROM Groups WHERE id = '"+groupid+"';";
            return st.executeUpdate(query);
        }
        catch(SQLException se)
        {
            System.out.println(se);
            System.out.println("database class: deletegroup method-cannot delete group");
            return 0;
        }
    }
    
    public boolean isUserValid(User user)
    {
        String type = user.getType();
        String id = user.getId();
        String password = user.getPassword();
        query = "SELECT * FROM "+type+" WHERE id = '"+id+"' AND password = '"+password+"';";
        try
        {
            st = con.createStatement();
            rs = st.executeQuery(query);
            if(rs.next())
                return true; 
        }
        catch(SQLException se)
        {
            System.out.println(se);
            return false; 
        }
        return false;
    }
    
    public void closedatabase()
    {
        DatabaseUtil.closeConnection(this.con);
        DatabaseUtil.closeStatement(this.st);
        DatabaseUtil.closeResultSet(this.rs);
    }
    
}
