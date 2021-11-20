package com.example.pollsystemproject.daoimpl;

import com.example.pollsystemproject.dao.UserDAO;
import com.example.pollsystemproject.db.DBConnection;
import com.example.pollsystemproject.model.User;

import java.sql.*;
import java.util.HashSet;
import java.util.Set;

public class UserDaoImpl implements UserDAO {

    @Override
    public User getUser(int id) {
        // DB connection
        Connection connection = DBConnection.getConnection();

        try {

            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM users WHERE user_id=" + id);

            if(rs.next())
            {
//                com.example.pollsystemproject.model.User user = new com.example.pollsystemproject.model.User();
//                user.setUserId( rs.getInt("user_id") );
//                user.setFirstName( rs.getString("first_name") );
//                user.setLastName( rs.getString("Last_name") );
//                user.setEmail( rs.getString("email"));
//                user.setPassword( rs.getString("password") );
                //return user;
                return extractUserFromResultSet(rs);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch(SQLException e){
                e.printStackTrace();
            }
        }

        return null;
    }



    @Override
    public Set<User> getAllUsers() {

        Connection connection = DBConnection.getConnection();
        try {
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM users");

            Set users = new HashSet();

            while(rs.next())
            {
                User user = extractUserFromResultSet(rs);
                users.add(user);
            }

            return users;

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch(SQLException e){
                e.printStackTrace();
            }
        }

        return null;
    }

//    @Override
//    public User getUserByUserIDAndPassword(int id, String password) {
//        // TODO: Try it yourself
//        // Hint : Use 'AND' in your query
//
//        return null;
//    }

    @Override
    public boolean insertUser(User user) {

        Connection connection = DBConnection.getConnection();

        try {
            String query = "INSERT INTO users (user_id,first_name,last_name,email,password) VALUES (?, ?, ?, ?, ?)";
            // Passing Statement.RETURN_GENERATED_KEYS to make getGeneratedKeys() work
            PreparedStatement ps = connection.prepareStatement(query);

            ps.setInt(1, user.getUserId());
            ps.setString(2, user.getFirstName());
            ps.setString(3, user.getLastName());
            ps.setString(4, user.getEmail());
            ps.setString(5, user.getPassword());

            ps.executeUpdate();
            int i = ps.executeUpdate();

            if(i == 1) {
                return true;
            }

        }
        catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            try {
                connection.close();
            }
            catch(SQLException e){
                e.printStackTrace();
            }
        }

        return false;
    }

    @Override
    public boolean updateUser(User user) {

        Connection connection = DBConnection.getConnection();

        try {
            PreparedStatement ps = connection.prepareStatement("UPDATE users SET first_name=?, last_name=?, email=?, password=? WHERE user_id=?");

            ps.setString(1, user.getFirstName());
            ps.setString(2, user.getLastName());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getPassword());
            ps.setInt(5,user.getUserId());

            int i = ps.executeUpdate();

            if(i == 1) {
                return true;
            }

        }
        catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            try {
                connection.close();
            }
            catch(SQLException e){
                e.printStackTrace();
            }
        }

        return false;
    }

    @Override
    public boolean deleteUser(int id) {

        Connection connection = DBConnection.getConnection();

        try {
            Statement stmt = connection.createStatement();
            int i = stmt.executeUpdate("DELETE FROM users WHERE user_id=" + id);

            if(i == 1) {
                return true;
            }

        }
        catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            try {
                connection.close();
            }
            catch(SQLException e){
                e.printStackTrace();
            }
        }

        return false;
    }

    @Override
    public boolean check(int id, String pass) {
        // DB connection
        Connection connection = DBConnection.getConnection();


        try {
            PreparedStatement ps = connection.prepareStatement("SELECT * FROM users WHERE user_id=? and password=?");
            ps.setInt(1, id);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();

            if(rs.next())
            {
                return true;
            }

        }
        catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            }
            catch(SQLException e){
                e.printStackTrace();
            }
        }
        return false;

    }

    private User extractUserFromResultSet(ResultSet rs) throws SQLException {

        User user = new User();
        user.setUserId( rs.getInt("user_id") );
        user.setFirstName( rs.getString("first_name") );
        user.setLastName( rs.getString("last_name") );
        user.setEmail( rs.getString("email"));
        user.setPassword( rs.getString("password") );
        return user;
    }
}
