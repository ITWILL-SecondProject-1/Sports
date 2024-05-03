package com.sports.resv.controller;

import com.google.gson.Gson;
import com.sports.model.dao.ResDAO;
import com.sports.model.vo.ResVO;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

@WebServlet("/submitReservation")
public class ResController extends HttpServlet {
    private Gson gson = new Gson();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json;charset=UTF-8");

        ResVO reservation = gson.fromJson(request.getReader(), ResVO.class);
        boolean result = ResDAO.addReservation(reservation);

        if (result) {
            response.getWriter().write(gson.toJson(new MessageResponse("예약 성공")));
        } else {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write(gson.toJson(new MessageResponse("예약 실패 - 수용 인원 초과")));
        }
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json;charset=UTF-8");

        ResVO reservation = gson.fromJson(new InputStreamReader(request.getInputStream()), ResVO.class);

        boolean result = ResDAO.editReservation(reservation);

        if (result) {
            response.getWriter().write(gson.toJson(new MessageResponse("예약 변경 성공")));
        } else {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write(gson.toJson(new MessageResponse("예약 변결 실패")));
        }
    }

    

    private class MessageResponse {
        private String message;

        public MessageResponse(String message) {
            this.message = message;
        }

        public String getMessage() {
            return message;
        }
    }
}
