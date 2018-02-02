package com.model;

public class User {
    private String username;
    private String password;
    private Cart cart;

    public User(String username, String password, Cart cart){
        this.username = username;
        this.password = password;
        this.cart = cart;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Cart getCart() {
        return cart;
    }

    public void setCart(Cart cart) {
        this.cart = cart;
    }
}
