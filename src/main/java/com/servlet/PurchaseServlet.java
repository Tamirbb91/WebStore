package com.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class PurchaseServlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //Cookie shalgah
        req.getRequestDispatcher("WEB-INF/secure/final_confirmation.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        billing address shalgah
        req.getSession().setAttribute("errormsg", "");
        req.getSession().setAttribute("purchaseItems", "");
        req.getSession().setAttribute("totalSum", "0");
        req.getRequestDispatcher("WEB-INF/secure/thankyou.jsp").forward(req, resp);
    }
}
