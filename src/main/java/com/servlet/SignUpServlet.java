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
            String firstname = req.getParameter("firstname");
            String lastname = req.getParameter("lastname");
            String email = req.getParameter("email");
            String username = req.getParameter("username");
            String password = req.getParameter("password");

            if(Database.allusers.containsKey(username)){
                req.setAttribute("errormsg", "Username is already exists !");
            } else {
                User user =  new User(username, password, new Cart());
                Database.allusers.put(username, user);
                HttpSession session = req.getSession();
                session.setAttribute("user", user);
                resp.sendRedirect("/home");
                return;
            }
        } catch (Exception e){
            System.out.println(e.getMessage());
        }
        req.getRequestDispatcher("/loginOrSignup.jsp").forward(req, resp);
    }
}
