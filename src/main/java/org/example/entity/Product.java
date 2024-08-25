package org.example.entity;

import jakarta.persistence.*;
import org.generatedDao.Category;

import java.io.Serializable;
@Entity
public class Product implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "product_id",unique = true, nullable = false)
    private int productId;
    @Column(nullable = false)
    @ManyToOne()
    @JoinColumn(name="category_id", nullable=false)
    private Category category;
    private String productName;
    private String description;
    private Integer quantity;
    private Integer price;
    public Product() {}
    public Product(int productId, Category category, String productName, String description, Integer quantity, Integer price) {
        this.productId = productId;
        this.category = category;
        this.productName = productName;
        this.description = description;
        this.quantity = quantity;
        this.price = price;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }
}
