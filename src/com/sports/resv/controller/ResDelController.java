package com.sports.resv.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sports.model.dao.ResDAO;

@WebServlet("/deleteReservation")
public class ResDelController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String reservationId = request.getParameter("reservationId");
        System.out.println("삭제된 예약번호: " + reservationId);

        if (reservationId != null && !reservationId.isEmpty()) {
            try {
                int id = Integer.parseInt(reservationId);
                boolean isDeleted = ResDAO.deleteReservation(id);

                if (isDeleted) {
                    response.getWriter().write("예약이 삭제되었습니다.");
                } else {
                    response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                    response.getWriter().write("예약삭제에 실패하였습니다.");
                }
            } catch (NumberFormatException e) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                response.getWriter().write("유효하지않습니다.");
            }
        } else {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("예약아이디 필요.");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doDelete(request, response);
    }
}
