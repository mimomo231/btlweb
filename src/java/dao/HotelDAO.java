/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Hotel;

/**
 *
 * @author Computer
 */
public class HotelDAO extends DAO {
    public ArrayList<Hotel> getTopBookingHotel(){
        ArrayList<Hotel> hotel = new ArrayList<>();
        String sql = "SELECT h.id,h.name,h.address,h.star,h.des,h.image, COUNT(h.id) as c FROM tblhotel h "
                + "INNER JOIN tblroom ON tblroom.hotelID = h.id " +
                  "INNER JOIN tblbookedroom ON tblroom.id = tblbookedroom.roomID " +
                    "GROUP BY h.id " +
                    "ORDER BY c DESC LIMIT 12";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Hotel ht = new Hotel();
                ht.setId(rs.getInt("id"));
                ht.setName(rs.getString("name"));
                ht.setAddress(rs.getString("address"));
                ht.setStar(rs.getInt("star"));
                ht.setDes(rs.getString("des"));
                ht.setImage(rs.getString("image"));
                hotel.add(ht);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return hotel;
    }
    public ArrayList<Hotel> getAllHotel() {
        ArrayList<Hotel> hotel = new ArrayList<>();
        String sql = "select * from tblhotel";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Hotel ht = new Hotel();
                ht.setId(rs.getInt("id"));
                ht.setName(rs.getString("name"));
                ht.setAddress(rs.getString("address"));
                ht.setStar(rs.getInt("star"));
                ht.setDes(rs.getString("des"));
                ht.setImage(rs.getString("image"));
                hotel.add(ht);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }

        return hotel;
    }
    
    public Hotel getHotelByID(int id) {
        Hotel ht = new Hotel();
        String sql = "select * from tblhotel where id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                ht.setId(rs.getInt("id"));
                ht.setName(rs.getString("name"));
                ht.setAddress(rs.getString("address"));
                ht.setStar(rs.getInt("star"));
                ht.setDes(rs.getString("des"));
                ht.setImage(rs.getString("image"));
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return ht;
    }
    
    public void deleteHotel(int id) {
        String sql = "delete from tblhotel where id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }
    
    public void insertHotel(Hotel hotel) {
        String sql = "INSERT INTO tblhotel(name, address, star, des, image) VALUES (?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, hotel.getName());
            ps.setString(2, hotel.getAddress());
            ps.setInt(3, hotel.getStar());
            ps.setString(4, hotel.getDes());
            ps.setString(5, hotel.getImage());
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }
    
    public void updateHotel(Hotel hotel) {
        String sql = "UPDATE tblhotel SET name = ?, address = ?, star = ?, des = ?, image = ? WHERE id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, hotel.getName());
            ps.setString(2, hotel.getAddress());
            ps.setInt(3, hotel.getStar());
            ps.setString(4, hotel.getDes());
            ps.setString(5, hotel.getImage());
            ps.setInt(6, hotel.getId());
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }
}
