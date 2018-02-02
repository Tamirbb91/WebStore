package com.model;

import java.util.ArrayList;
import java.util.List;

public class Cart {
    private List<Product> products = new ArrayList<>();
    private User owner;

    public Cart(){

    }

    public void addProduct(Product product){
        products.add(product);
    }

    public boolean removeProduct(Product product){
        return products.remove(product);
    }

    public User getOwner() {
        return owner;
    }

    public void setOwner(User owner) {
        this.owner = owner;
    }

    public List<Product> getProducts() {
        return products;
    }
}
