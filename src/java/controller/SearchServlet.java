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
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Hotel;
import model.Room;

/**
 *
 * @author Sao Viet
 */
public class SearchServlet extends HttpServlet {

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
            out.println("<title>Servlet SearchServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SearchServlet at " + request.getContextPath() + "</h1>");
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
        try {
            RoomDAO rd = new RoomDAO();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String ad = request.getParameter("address");
            String[] c = request.getParameter("checkin").split("/");
            String ci = c[2]+"-"+c[1]+"-"+c[0];
            c = request.getParameter("checkout").split("/");
            String co = c[2]+"-"+c[1]+"-"+c[0];
            ArrayList<Room> rooms = rd.searchFreeRoom(ad,sdf.parse(ci), sdf.parse(co));
            HotelDAO hd = new HotelDAO();
            ArrayList<Hotel> hotel = new ArrayList<>();
            int t = 0;
            int i =0;
            for(Room r : rooms){
                Hotel h = r.getHotel();
                h = hd.getHotelByID(h.getId());
                r.setHotel(h);
                
                rooms.set(i, r);
                if(h.getId()!=t){
                    t = h.getId();
                    hotel.add(h);
                }
                i+=1;
            }
            request.setAttribute("hotel", hotel);
            request.getSession().setAttribute("cii", ci);
            request.getSession().setAttribute("coo", co);
            request.setAttribute("ci", ci);
            request.setAttribute("co", co);
            request.setAttribute("ad", ad);
            request.setAttribute("size", c);
            request.getRequestDispatcher("searchresult.jsp").forward(request, response);
            
        }catch(Exception ex) {
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
