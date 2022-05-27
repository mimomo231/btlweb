/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.BookingDao;
import dao.RoomDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.BookedRoom;
import model.Booking;
import model.Room;
import model.User;

/**
 *
 * @author Sao Viet
 */
public class BookingServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //lol
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet BookingServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BookingServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        try{
            int rid = Integer.parseInt(request.getParameter("rid"));
            Booking b = new Booking();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            if(request.getSession().getAttribute("auth") == null){
                response.sendRedirect("login");
            }else{
                RoomDAO rd = new RoomDAO();
                Room r = rd.getRoomByID(rid);
                
                BookedRoom bookedroom = new BookedRoom();
                bookedroom.setCheckin(sdf.parse((String)request.getSession().getAttribute("cii")));
                bookedroom.setCheckin(sdf.parse((String)request.getSession().getAttribute("coo")));
                bookedroom.setPrice(r.getPrice());
                bookedroom.setRoom(r);
                //System.out.println((String)request.getSession().getAttribute("cii"));
                b.setCreator((User)request.getSession().getAttribute("auth"));
                b.getRooms().add(bookedroom);
                BookingDao bkingd = new BookingDao();
                boolean check = bkingd.addBooking(b);
                request.getRequestDispatcher("booking.jsp").forward(request, response);
            }
        }catch(Exception e){
            
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
