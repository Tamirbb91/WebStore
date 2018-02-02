package com;

import com.model.Cart;
import com.model.Product;
import com.model.User;

import java.util.HashMap;

public class Database {
    public static HashMap<String, User> allusers = new HashMap<>();
    public static HashMap<String, Product> allproducts = new HashMap<>();
    static{
        User user1 = new User("Tamir", "Password", new Cart());
        User user2 = new User("Admin", "PassW0rd", new Cart());
        User user3 = new User("Test", "paaswoord", new Cart());
        allusers.put("Tamir", user1);
        allusers.put("Admin", user2);
        allusers.put("Test", user3);

        Product prod1 = new Product("shirt1","YouTube Ultimate Hooded Sweatshirt", "https://shop.polymer-project.org/es6-unbundled/data/images/10-14133A.jpg", 32.35);
        Product prod2 = new Product("shirt2","Grey Heather Fleece Zip Hoodie", "https://shop.polymer-project.org/es6-unbundled/data/images/10-14152A.jpg", 38.85);
        Product prod3 = new Product("shirt3","Rowan Pullover Hood", "https://shop.polymer-project.org/es6-unbundled/data/images/10-14160A.jpg", 60.85);
        allproducts.put(prod1.getProductId(), prod1);
        allproducts.put(prod2.getProductId(), prod2);
        allproducts.put(prod3.getProductId(), prod3);
    }

    public static Boolean login(String username, String password){
        try {
            return allusers.get(username).getPassword().equals(password);
        } catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }

    public static User signup(String username, String password){
        return null;
    }
}
