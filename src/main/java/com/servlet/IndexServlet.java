package com.servlet;

import com.Database;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;

public class IndexServlet extends HttpServlet {
    @Override
    public void init() throws ServletException {
        Database.init();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(true);
        session.setAttribute("errormsg", "");
        session.setAttribute("allproducts", Database.allproducts);
        resp.addCookie(new Cookie("product", ""));
        req.getRequestDispatcher("/index.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
