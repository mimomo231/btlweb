/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.User;

/**
 *
 * @author Computer
 */
public class UserDAO extends DAO {

    public boolean checkLogin(User us) {
        boolean result = false;
        String sql = "SELECT id, name, email, role FROM tblUser WHERE username = ? AND pass = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, us.getUsername());
            ps.setString(2, us.getPassword());
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                us.setId(rs.getInt("id"));
                us.setName(rs.getString("name"));
                us.setEmail(rs.getString("email"));
                us.setRole(rs.getInt("role"));
                result = true;
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return result;
    }

    public User getUserByEmail(String email) {
        try {
            String sql = "select * from tbluser where email = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setUsername(rs.getString("username"));
                return user;
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }
    
    public User getUserByUsername(String username) {
        try {
            String sql = "select * from tbluser where username = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setUsername(rs.getString("username"));
                return user;
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }

    public void insertUser(User us) {
        try {
            String sql = "insert into tbluser (name, email, username, pass, role, note) values (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, us.getName());
            ps.setString(2, us.getEmail());
            ps.setString(3, us.getUsername());
            ps.setString(4, us.getPassword());
            ps.setInt(5, us.getRole());
            ps.setString(6, us.getNote());
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.print(ex);
        }
    }

    public void updateUser(User us) {
        try {
            String sql = "update tbluser set pass = ? WHERE email = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, us.getPassword());
            ps.setString(2, us.getEmail());
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }
}
