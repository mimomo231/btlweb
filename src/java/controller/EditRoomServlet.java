/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.HotelDAO;
import dao.RoomDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Hotel;
import model.Room;

/**
 *
 * @author Computer
 */
public class EditRoomServlet extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditRoomServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditRoomServlet at " + request.getContextPath() + "</h1>");
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

        String id_raw = request.getParameter("id");

        try {
            int id = Integer.parseInt(id_raw);
            RoomDAO rdao = new RoomDAO();
            Room room = rdao.getRoomByID(id);
            HotelDAO hdao = new HotelDAO();
            ArrayList<Hotel> hotel = hdao.getAllHotel();
            request.setAttribute("hdata", hotel);
            request.setAttribute("data", room);
            request.setAttribute("htid", room.getHotel().getId());
            request.getRequestDispatcher("editRoom.jsp").forward(request, response);

        } catch (NumberFormatException ex) {
            System.out.println(ex);
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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");

        String id_raw = request.getParameter("edit-id");
        String name = request.getParameter("edit-name");
        String type = request.getParameter("edit-type");
        String price_raw = request.getParameter("edit-price");
        String des = request.getParameter("edit-des");
        String image = request.getParameter("edit-image");
        String hid_raw = request.getParameter("hotel-id");

        try {
            int id = Integer.parseInt(id_raw);
            float price = Float.parseFloat(price_raw);
            int hid = Integer.parseInt(hid_raw);
            Hotel ht = new Hotel();
            ht.setId(hid);
            
            Room room = new Room(id, name, type, price, des, image, ht);
            RoomDAO rdao = new RoomDAO();
            rdao.updateRoom(room);
            response.sendRedirect("roommanager");
        } catch (NumberFormatException ex) {
            System.out.println(ex);
        }
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
