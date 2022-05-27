/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.Date;

/**
 *
 * @author Sao Viet
 */
public class BookedRoom {
    private int id;
    private Date checkin;
    private Date checkout;
    private float price;
    private Room room;

    public BookedRoom() {
    }

    public BookedRoom(int id, Date checkin, Date checkout, float price, Room room) {
        this.id = id;
        this.checkin = checkin;
        this.checkout = checkout;
        this.price = price;
        this.room = room;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getCheckin() {
        return checkin;
    }

    public void setCheckin(Date checkin) {
        this.checkin = checkin;
    }

    public Date getCheckout() {
        return checkout;
    }

    public void setCheckout(Date checkout) {
        this.checkout = checkout;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }
    
    
}
