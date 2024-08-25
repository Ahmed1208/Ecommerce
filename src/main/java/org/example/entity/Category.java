package org.example.entity;

import jakarta.persistence.*;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

@Entity
public class Category implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "category_id",unique = true, nullable = false)
    private int id;

    @Column(name = "category_name", nullable = false)
    private String name;

    private String description;

    @Column(name = "main_category_id")
    private String mainCategoryId;

    @OneToMany(fetch=FetchType.LAZY, mappedBy="category")
    private Set<Product> products=new HashSet<Product>();

    public Category() {}
    public Category(String name, String description, String mainCategoryId) {
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

    public String getMainCategoryId() {
        return mainCategoryId;
    }

    public void setMainCategoryId(String mainCategoryId) {
        this.mainCategoryId = mainCategoryId;
    }
}
