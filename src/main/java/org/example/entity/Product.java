package org.example.entity;

import jakarta.persistence.*;

import java.io.Serializable;
import java.util.Set;

@Entity
@Table(name="product")
public class Product implements Serializable {

    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name="product_name")
    private String productName;
    private String description;
    private Integer quantity;
    private Double price;
    private String image;

    @ManyToOne
    private Category category;

    @OneToMany(mappedBy = "product")
    private Set<OrderProductList> OrderProductList;

    @OneToMany(mappedBy = "product")
    private Set<UserProductCart> userProductCarts;



    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Integer getProductId() {
        return id;
    }
    public void setProductId(Integer id) {
        this.id = id;
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

    public Double getPrice() {
        return price;
    }
    public void setPrice(Double price) {
        this.price = price;
    }

    public Category getCategory() {
        return category;
    }
    public void setCategory(Category category) {
        this.category = category;
    }

    public Set<UserProductCart> getUserProductCarts() {
        return userProductCarts;
    }

    public void setUserProductCarts(Set<UserProductCart> userProductCarts) {
        this.userProductCarts = userProductCarts;
    }

    public Set<org.example.entity.OrderProductList> getOrderProductList() {
        return OrderProductList;
    }

    public void setOrderProductList(Set<org.example.entity.OrderProductList> orderProductList) {
        OrderProductList = orderProductList;
    }
}
