/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import static dao.DAO.con;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import model.Hotel;
import model.Room;

/**
 *
 * @author Computer
 */
public class RoomDAO extends DAO {
    public ArrayList<Room> searchFreeRoomByIdHotel(int id,Date checkin, Date checkout){
            ArrayList<Room> result = new ArrayList<>();
            String sql = "SELECT r.id,r.name,r.type,r.price,r.des,r.image, r.HotelID FROM tblRoom r "
                    + "INNER JOIN tblhotel ON r.HotelID = tblhotel.id WHERE tblhotel.id=? "
                    + "AND r.id NOT IN (SELECT roomID FROM tblBookedRoom WHERE checkout > ? AND checkin < ?) "
                    + "ORDER BY r.HotelID";
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            try{
                    PreparedStatement ps = con.prepareStatement(sql);
                    ps.setInt(1,id);
                    ps.setString(2, sdf.format(checkin));
                    ps.setString(3, sdf.format(checkout));
                    ResultSet rs = ps.executeQuery();

                    while(rs.next()){
                            Room rm = new Room();
                            rm.setId(rs.getInt("id"));
                            rm.setName(rs.getString("name"));
                            rm.setType(rs.getString("type"));
                            rm.setPrice(rs.getFloat("price"));
                            rm.setDes(rs.getString("des"));
                            rm.setImage(rs.getString("image"));
                            Hotel h = new Hotel();
                            h.setId(rs.getInt("hotelID"));
                            rm.setHotel(h);
                            result.add(rm);
                    }
            }catch(Exception e){
                    e.printStackTrace();
            }	
            return result;
	}
    
    public ArrayList<Room> searchFreeRoom(String address,Date checkin, Date checkout){
            ArrayList<Room> result = new ArrayList<Room>();
            String sql = "SELECT r.id,r.name,r.type,r.price,r.des,r.image, r.HotelID FROM tblRoom r "
                    + "INNER JOIN tblhotel ON r.HotelID = tblhotel.id WHERE tblhotel.address LIKE ? "
                    + "AND r.id NOT IN (SELECT roomID FROM tblBookedRoom WHERE checkout > ? AND checkin < ?) "
                    + "ORDER BY r.HotelID";
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            try{
                    PreparedStatement ps = con.prepareStatement(sql);
                    ps.setString(1, "%" + address + "%");
                    ps.setString(2, sdf.format(checkin));
                    ps.setString(3, sdf.format(checkout));
                    ResultSet rs = ps.executeQuery();

                    while(rs.next()){
                            Room rm = new Room();
                            rm.setId(rs.getInt("id"));
                            rm.setName(rs.getString("name"));
                            rm.setType(rs.getString("type"));
                            rm.setPrice(rs.getFloat("price"));
                            rm.setDes(rs.getString("des"));
                            rm.setImage(rs.getString("image"));
                            Hotel h = new Hotel();
                            h.setId(rs.getInt("hotelID"));
                            rm.setHotel(h);
                            result.add(rm);
                    }
            }catch(Exception e){
                    e.printStackTrace();
            }	
            return result;
	}
    public ArrayList<Room> getRoomByHid(int hid) {
        ArrayList<Room> room = new ArrayList<>();
        String sql = "select r.id, r.name, r.type, r.price, r.des, r.image, h.id as hid, h.name as hname from tblroom as r INNER JOIN tblhotel as h ON r.hotelID = h.id";
        if (hid != 0) {
            sql += " where hotelID = "+hid;
        }
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Hotel ht = new Hotel();
                ht.setId(rs.getInt("hid"));
                ht.setName(rs.getString("hname"));

                Room rm = new Room();
                rm.setId(rs.getInt("id"));
                rm.setName(rs.getString("name"));
                rm.setType(rs.getString("type"));
                rm.setPrice(rs.getFloat("price"));
                rm.setDes(rs.getString("des"));
                rm.setImage(rs.getString("image"));
                rm.setHotel(ht);
                room.add(rm);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }

        return room;
    }

    public Room getRoomByID(int id) {
        String sql = "select * from tblroom where id = ?";
        Room rm = new Room();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Hotel ht = new Hotel();
                ht.setId(rs.getInt("hotelID"));

                
                rm.setId(rs.getInt("id"));
                rm.setName(rs.getString("name"));
                rm.setType(rs.getString("type"));
                rm.setPrice(rs.getFloat("price"));
                rm.setDes(rs.getString("des"));
                rm.setImage(rs.getString("image"));
                rm.setHotel(ht);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }

        return rm;
    }

    public void deleteRoom(int id) {
        String sql = "delete from tblroom where id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public void insertRoom(Room room) {
        String sql = "INSERT INTO tblroom(name, type, price, des, image, hotelID) VALUES (?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, room.getName());
            ps.setString(2, room.getType());
            ps.setFloat(3, room.getPrice());
            ps.setString(4, room.getDes());
            ps.setString(5, room.getImage());
            ps.setInt(6, room.getHotel().getId());
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public void updateRoom(Room room) {
        String sql = "UPDATE tblroom SET name = ?, type = ?, price = ?, des = ?, image = ?, hotelID = ? WHERE id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, room.getName());
            ps.setString(2, room.getType());
            ps.setFloat(3, room.getPrice());
            ps.setString(4, room.getDes());
            ps.setString(5, room.getImage());
            ps.setInt(6, room.getHotel().getId());
            ps.setInt(7, room.getId());
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }
}
