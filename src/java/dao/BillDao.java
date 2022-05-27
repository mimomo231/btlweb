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
import model.Bill;
import model.Booking;
import model.User;

/**
 *
 * @author Sao Viet
 */
public class BillDao extends DAO{
    public boolean addBill(Booking b){
        String sql = "INSERT INTO tblBill(amount,note,bookingID,userID) VALUES(?,?,?,?)";
        
        try{
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setFloat(1, b.getRooms().get(0).getPrice());
            ps.setString(2,"Waiting");
            ps.setInt(3,b.getId());
            ps.setInt(4,b.getCreator().getId());
            ps.executeUpdate();
        }catch(Exception e){
            return false;
        }
        return true;
    }
    public ArrayList<Bill> getBillByBid(int bid) {
        ArrayList<Bill> bill = new ArrayList<>();
        String sql = "select b.id, b.paymentDate, b.paymentMethod, b.amount, b.note, b.bookingID, us.id as uid, us.name as uname "
                + "from tblbill as b INNER JOIN tbluser as us on b.userID = us.id "
                + "WHERE b.bookingID = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, bid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User us = new User();
                us.setId(rs.getInt("uid"));
                us.setName(rs.getString("uname"));

                Booking bk = new Booking();
                bk.setId(rs.getInt("bookingID"));
                bk.setCreator(us);

                Bill b = new Bill();
                b.setId(rs.getInt("id"));
                b.setPaymentDate(rs.getDate("paymentDate"));
                b.setPaymentMethod(rs.getString("paymentMethod"));
                b.setAmount(rs.getFloat("amount"));
                b.setNote(rs.getString("note"));
                b.setBooking(bk);
                bill.add(b);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return bill;
    }

    public ArrayList<Bill> getBillByDate(String d1, String d2) {
        ArrayList<Bill> bill = new ArrayList<>();
        String sql = "select b.id, b.paymentDate, b.paymentMethod, b.amount, b.note, b.bookingID, us.id as uid, us.name as uname "
                + "from tblbill as b INNER JOIN tbluser as us on b.userID = us.id where b.note = 'Done'";
        if (!d1.equals("") && !d2.equals("")) {
            sql += " and b.paymentDate between ? and ?";
        }
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            if (!d1.equals("") && !d2.equals("")) {
                ps.setString(1, d1);
                ps.setString(2, d2);
            }
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User us = new User();
                us.setId(rs.getInt("uid"));
                us.setName(rs.getString("uname"));

                Booking bk = new Booking();
                bk.setId(rs.getInt("bookingID"));
                bk.setCreator(us);

                Bill b = new Bill();
                b.setId(rs.getInt("id"));
                b.setPaymentDate(rs.getDate("paymentDate"));
                b.setPaymentMethod(rs.getString("paymentMethod"));
                b.setAmount(rs.getFloat("amount"));
                b.setNote(rs.getString("note"));
                b.setBooking(bk);
                bill.add(b);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return bill;
    }

    public void updateBill(Bill bill) {
        String sql = "UPDATE tblbill SET paymentDate = ?, paymentMethod = ?, note = ? WHERE id = ?";
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, sdf.format(bill.getPaymentDate()));
            ps.setString(2, bill.getPaymentMethod());
            ps.setString(3, bill.getNote());
            ps.setInt(4, bill.getId());
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }
}
