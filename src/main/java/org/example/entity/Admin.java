package org.example.entity;

import java.io.Serializable;

public class Admin extends Person implements Serializable {

    private int id;

    public int getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }

}
