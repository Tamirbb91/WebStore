package com.servlet;

import com.Database;
import com.model.Cart;
import com.model.User;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;

public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/loginOrSignup.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try{
            String username = req.getParameter("username");
            String password = req.getParameter("password");
            String rememberMe = req.getParameter("remember_me");
            if(Database.login(username, password)){
                if(rememberMe != null && rememberMe.equals("on")){
                    Cookie usernameCookie = new Cookie("username", username);
                    usernameCookie.setMaxAge(30* 24 * 60 * 60);
                    resp.addCookie(usernameCookie);
                } else {
                    Cookie[] cookies = req.getCookies();
                    for(Cookie cookie : cookies){
                        if(cookie.getName().equals("username")){
                            cookie.setValue("");
                            cookie.setMaxAge(-100);
                            resp.addCookie(cookie);
                            break;
                        }
                    }
                }
                HttpSession session = req.getSession();
                session.setAttribute("user", new User(username, password, new Cart()));
                req.setAttribute("errormsg", "");
                resp.sendRedirect("/home");
                return;
            } else {
                req.setAttribute("errormsg", "Username or Password is invalid!");
                req.getRequestDispatcher("/loginOrSignup.jsp").forward(req, resp);
            }
        } catch (Exception e){
            e.printStackTrace();
        }

        req.getRequestDispatcher("/loginOrSignup.jsp").forward(req, resp);
    }
}
