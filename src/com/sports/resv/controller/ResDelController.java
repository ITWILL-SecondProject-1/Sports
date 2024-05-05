package com.sports.resv.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.sports.model.dao.ResDAO;

@WebServlet("/deleteReservation")
public class ResDelController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private Gson gson = new Gson();  // Gson 객체 추가

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String reservationId = request.getParameter("reservationId");
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        if (reservationId != null && !reservationId.isEmpty()) {
            try {
                int id = Integer.parseInt(reservationId);
                boolean isDeleted = ResDAO.deleteReservation(id);

                if (isDeleted) {
                    response.getWriter().write(gson.toJson(new StatusResponse("예약이 삭제되었습니다.", true)));
                } else {
                    response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                    response.getWriter().write(gson.toJson(new StatusResponse("예약삭제에 실패하였습니다.", false)));
                }
            } catch (NumberFormatException e) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                response.getWriter().write(gson.toJson(new StatusResponse("유효하지 않은 예약 번호입니다.", false)));
            }
        } else {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write(gson.toJson(new StatusResponse("예약 번호가 필요합니다.", false)));
        }
    }

    private class StatusResponse {
        String message;
        boolean success;

        public StatusResponse(String message, boolean success) {
            this.message = message;
            this.success = success;
        }
    }
}
