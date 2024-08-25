package org.example.entity;

import jakarta.persistence.*;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

public class Category implements Serializable {

    private int id;
    private String name;
    private String description;
    private int mainCategoryId;


    public Category() {}
    public Category(String name, String description, int mainCategoryId) {
        this.name = name;
        this.description = description;
        this.mainCategoryId = mainCategoryId;
    }

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }

    public int getMainCategoryId() {
        return mainCategoryId;
    }
    public void setMainCategoryId(int mainCategoryId) {
        this.mainCategoryId = mainCategoryId;
    }
}
