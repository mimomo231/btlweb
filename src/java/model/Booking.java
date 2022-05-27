/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author Sao Viet
 */
public class Booking {
    private int id;
    private Date bookingDate;
    private String note;
    private User creator;
    private ArrayList<BookedRoom> rooms;

    public Booking() {
        rooms = new ArrayList<>();
    }

    public Booking(int id, Date bookingDate, String note, User creator) {
        this.id = id;
        this.bookingDate = bookingDate;
        this.note = note;
        this.creator = creator;
        rooms = new ArrayList<>();
    }

    public void setRooms(ArrayList<BookedRoom> rooms) {
        this.rooms = rooms;
    }

    public ArrayList<BookedRoom> getRooms() {
        return rooms;
    }

    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getBookingDate() {
        return bookingDate;
    }

    public void setBookingDate(Date bookingDate) {
        this.bookingDate = bookingDate;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public User getCreator() {
        return creator;
    }

    public void setCreator(User creator) {
        this.creator = creator;
    }
    
}
