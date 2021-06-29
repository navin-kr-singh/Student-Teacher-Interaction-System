package sti.DatabaseOperations;

import java.sql.*;

public class DatabaseUtil 
{
    public static void closeConnection(Connection con)
    {
        try
        {
            if(con!=null)
                con.close();
        }
        catch(SQLException se)
        {
            System.out.println(se);
        }
    }
    
    public static void closeStatement(Statement st)
    {
        try
        {
            if(st!=null)
                st.close();
        }
        catch(SQLException se)
        {
            System.out.println(se);
        }
    }
        
    public static void closeResultSet(ResultSet rs)
    {
        try
        {
            if(rs!=null)
                rs.close();
        }
        catch(SQLException se)
        {
            System.out.println(se);
        }
    }    
        
        
}
