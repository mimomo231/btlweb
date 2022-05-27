/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import model.Booking;
import model.User;

/**
 *
 * @author Sao Viet
 */
public class BookingDao extends DAO{
    public boolean addBooking(Booking b){
        String sql = "INSERT INTO tblBooking(bookingDate,note,userID) VALUES(?,?,?)";
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try{
            PreparedStatement ps = con.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
            ps.setString(1,sdf.format(new Date()));
            ps.setString(2,"");
            ps.setInt(3, b.getCreator().getId());
            ps.executeUpdate();
            
            ResultSet generatedKeys = ps.getGeneratedKeys();
            if (generatedKeys.next()) {
                b.setId(generatedKeys.getInt(1));
            }

            BillDao bd = new BillDao();
            boolean c = bd.addBill(b);
            
            BookedRoomDao bkd = new BookedRoomDao();
            bkd.addBookedRoom(b);
            if(!c) return false;
        }catch(Exception e){
            return false;
        }
        return true;
    }
    public ArrayList<Booking> getBookingByEmail(String email) {
        ArrayList<Booking> booking = new ArrayList<>();
        String sql = "select bk.id, bk.bookingDate, bk.note, us.id as uid, us.name as uname, us.email as uemail "
                + "from tblbooking as bk inner join tbluser as us on bk.userID = us.id";
        if (!email.equals("")) {
            sql += " where email like '%" + email + "%'";
        }

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User us = new User();
                us.setId(rs.getInt("uid"));
                us.setName(rs.getString("uname"));
                us.setEmail(rs.getString("uemail"));

                Booking bk = new Booking();
                bk.setId(rs.getInt("id"));
                bk.setBookingDate(rs.getDate("bookingDate"));
                bk.setNote(rs.getString("note"));
                bk.setCreator(us);
                booking.add(bk);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return booking;
    }
}
