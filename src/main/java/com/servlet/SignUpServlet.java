package com.servlet;

import com.Database;
import com.model.Cart;
import com.model.User;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;

public class SignUpServlet extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String username = req.getParameter("username");
            String password = req.getParameter("password");
            String email = req.getParameter("email");

            if(Database.allusers.containsKey(username)){
                req.setAttribute("error", "Username is already exists !");
            } else {
                User user =  new User(username, password, new Cart());
                Database.allusers.put(username, user);
                HttpSession session = req.getSession();
                session.setAttribute("user", user);
                resp.sendRedirect("/");
                return;
            }
        } catch (Exception e){
            System.out.println(e.getMessage());
        }
        req.getRequestDispatcher("/").forward(req, resp);
    }
}
