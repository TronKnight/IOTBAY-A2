package uts.isd.model.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import uts.isd.model.User;

/**
 * @author Dev
 */

public class UserManagerDAO {
    
    private Statement st;

    public UserManagerDAO(Connection conn) throws SQLException {
        st = conn.createStatement();
    }

    public User findUser(String email, String password) throws SQLException {
        String fetch = "SELECT * FROM IOTBAY.Users WHERE Email= '" + email + "' and Pass='" + password + "' ";
        ResultSet rs = st.executeQuery(fetch);
        while (rs.next()) {
            String userEmail = rs.getString(4); 
            String userPass = rs.getString(5);
            if ( userEmail.equals(email) && userPass.equals(password) ) {
                int userID  = rs.getInt(1);
                String userFirstName  = rs.getString(2);
                String userLastName  = rs.getString(3);
                String userPhone  = rs.getString(6);
                String userStreetNum  = rs.getString(7);
                String userStreetName  = rs.getString(8);
                String userSuburb  = rs.getString(9);
                String userState  = rs.getString(10);
                String userPostcode  = rs.getString(11);
                String userCountry  = rs.getString(12);
                // Get the info from query, create a new data object                
                return new User(
                    userID, 
                    userFirstName, 
                    userLastName, 
                    userEmail, 
                    userPass, 
                    userPhone, 
                    userStreetNum,
                    userStreetName,        
                    userSuburb,    
                    userState,    
                    userPostcode,    
                    userCountry    
                );
            }
        }
        return null;
    }

    public void addUser(String firstName, String lastName, String email, String password,
                        String phoneNumber, String streetNumber, String streetName,
                        String suburb, String state, String postcode, String country) throws SQLException {       
        String fetch = "INSERT INTO IOTBAY.USERS (FIRSTNAME, LASTNAME, EMAIL, PASS, PHONENUMBER, STREETNUMBER, STREETNAME, SUBURB, USTATE, POSTCODE, COUNTRY)"
                    + "VALUES ('" + firstName + "', '" + lastName + "', '" + email + "', '" + password + "', '" 
                    + phoneNumber + "', '" + streetNumber + "', '" + streetName + "', '" + suburb + "', '" 
                    + state + "', '" + postcode + "', '" + country + "')";
        st.execute(fetch);
    }
   
    public void updateUser(int Id, String firstName, String lastName, String email, String password,
            String phoneNumber, String streetNumber, String streetName,
            String suburb, String state, String postcode, String country) throws SQLException {

        String fetch = "UPDATE IOTBAY.Users "
                + "SET FIRSTNAME=" + "'" + firstName + "', "
                + "LASTNAME=" + "'" + lastName + "', "
                + "EMAIL=" + "'" + email + "', "
                + "PASS=" + "'" + password + "', "
                + "PHONENUMBER=" + "'" + phoneNumber + "', "
                + "STREETNUMBER=" + "'" + streetNumber + "', "
                + "STREETNAME=" + "'" + streetName + "', "
                + "SUBURB=" + "'" + suburb + "', "
                + "USTATE=" + "'" + state + "', "
                + "POSTCODE=" + "'" + postcode + "', "
                + "COUNTRY=" + "'" + country + "' "
                + "WHERE USERID=" + Id;
        System.out.print(fetch);
        st.executeUpdate(fetch);
    }

    public void deleteUser(String email) throws SQLException {
        String fetch = "DELETE FROM IOTBAY.Users WHERE EMAIL=" + email;
        st.executeUpdate(fetch);
    }

    public ArrayList<User> getUsers() throws SQLException {
        String fetch = "SELECT * FROM IOTBAY.Users";
        ResultSet rs = st.executeQuery(fetch);
        ArrayList<User> temp = new ArrayList<>();
        while (rs.next()) {
            temp.add(new User(
                    rs.getInt(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getString(4),
                    rs.getString(5),
                    rs.getString(6),
                    rs.getString(7),
                    rs.getString(8),
                    rs.getString(9),
                    rs.getString(10),
                    rs.getString(11),
                    rs.getString(12)
            ));
        }
        System.out.print("LIST OF USERS");
        System.out.print(temp);
        return temp;
    }

    public User getUserById(int Id) throws SQLException {
        String fetch = "SELECT * FROM IOTBAY.Users WHERE USERID=" + Id;
        ResultSet rs = st.executeQuery(fetch);
        while (rs.next()) {
            if (Id == rs.getInt("USERID")) {
                return new User(
                        rs.getInt("USERID"),
                        rs.getString("FIRSTNAME"),
                        rs.getString("LASTNAME"),
                        rs.getString("EMAIL"),
                        rs.getString("PASSWORD"),
                        rs.getString("PHONENUMBER"),
                        rs.getString("STREETNUMBER"),
                        rs.getString("STREETNAME"),
                        rs.getString("SUBURB"),
                        rs.getString("USTATE"),
                        rs.getString("POSTCODE"),
                        rs.getString("COUNTRY")
                );
            }
        }
        return null;
    }

    public int getUserID(String email) throws SQLException {
        String fetch = "SELECT * FROM IOTBAY.Users WHERE Email = '" + email + "'";
        ResultSet rs = st.executeQuery(fetch);

        while (rs.next()) {
            int userID = rs.getInt(1);
            String emails = rs.getString(4);

            if (email.equals(emails)) {
                return userID;
            }
        }
        return 0;
    }

    public boolean checkUser(String email) throws SQLException {
        String fetch = "SELECT * FROM IOTBAY.Users WHERE Email= '" + email + "'";
        ResultSet rs = st.executeQuery(fetch);
        while ( rs.next() ) {
            String userEmail = rs.getString(4);
            if ( userEmail.equals(email) ) {
                return true;
            }
        }
        return false;
    }

    public void addRegisterLog(int userID) throws SQLException {
        String registered = "Registered";
        String fetch = "INSERT INTO IOTBAY.UserLogs (USERID, STATUS ,CurrentTime) VALUES (" + userID + ",'" + registered + "',CURRENT_TIMESTAMP)";
        st.execute(fetch);
    }

    public void addLogoutLog(int userID) throws SQLException {
        String loggedOut = "Logged Out";
        String fetch = "INSERT INTO IOTBAY.UserLogs (USERID, STATUS ,CurrentTime) VALUES (" + userID + ",'" + loggedOut + "',CURRENT_TIMESTAMP)";
        st.execute(fetch);
    }

    public void addLoginLog(int userID) throws SQLException {
        String loggedIn = "Logged In";
        String fetch = "INSERT INTO IOTBAY.UserLogs (USERID, STATUS ,CurrentTime) VALUES (" + userID + ",'" + loggedIn + "',CURRENT_TIMESTAMP)";
        st.execute(fetch);
    }

    public ArrayList getStatusLogs(int userID) throws SQLException {
        ArrayList statuslist = new ArrayList();
        String fetch = "SELECT * FROM IOTBAY.UserLogs WHERE UserID =" + userID;
        ResultSet rs = st.executeQuery(fetch);
        while (rs.next()) {
            String status = rs.getString(2);
            statuslist.add(status);
        }
        return statuslist;
    }

    public ArrayList getTimeLogs(int userID) throws SQLException {
        ArrayList timelist = new ArrayList();
        String fetch = "SELECT * FROM IOTBAY.UserLogs WHERE UserID =" + userID;
        ResultSet rs = st.executeQuery(fetch);
        while (rs.next()) {
            String timedate = rs.getString(3);
            timelist.add(timedate);
        }
        return timelist;
    }
}
