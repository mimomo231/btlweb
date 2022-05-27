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
import model.BookedRoom;
import model.Booking;
import model.Room;

/**
 *
 * @author Sao Viet
 */
public class BookedRoomDao extends DAO{
    public void addBookedRoom(Booking b){
        String sql = "INSERT INTO tblbookedroom(checkin,checkout,price,bookingID,roomID) VALUES(?,?,?,?,?)";
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        try{
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1,sdf.format(b.getRooms().get(0).getCheckin()) );
            System.out.println(123456789);
            ps.setString(2,sdf.format(b.getRooms().get(0).getCheckout()) );
            ps.setFloat(3,b.getRooms().get(0).getPrice());
            ps.setInt(4,b.getId());
            ps.setInt(5,b.getRooms().get(0).getRoom().getId());
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    public ArrayList<BookedRoom> getBookedRoomByBid(int bid) {
        ArrayList<BookedRoom> bkroom = new ArrayList<>();
        String sql = "select bkr.id, bkr.checkin, bkr.checkout, bkr.price, r.id as rid, r.name as rname "
                + "from tblbookedroom as bkr INNER JOIN tblroom as r ON bkr.roomID = r.id "
                + "WHERE bkr.bookingID = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, bid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Room rm = new Room();
                rm.setId(rs.getInt("rid"));
                rm.setName(rs.getString("rname"));

                BookedRoom bkr = new BookedRoom();
                bkr.setId(rs.getInt("id"));
                bkr.setCheckin(rs.getDate("checkin"));
                bkr.setCheckout(rs.getDate("checkout"));
                bkr.setPrice(rs.getFloat("price"));
                bkr.setRoom(rm);
                bkroom.add(bkr);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }

        return bkroom;
    }
}
