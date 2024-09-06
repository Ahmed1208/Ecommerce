package org.example.bean;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;

@Getter
@Setter
@NoArgsConstructor
public class ProductBean implements Serializable {

    private Integer id;
    private String productName;
    private String description;
    private Integer quantity;
    private Double price;
    private String image;
    private String categoryName; // Representing Category as a String

    public ProductBean(Integer id, String productName, String description, Integer quantity, Double price, String image, String categoryName) {
        this.id = id;
        this.productName = productName;
        this.description = description;
        this.quantity = quantity;
        this.price = price;
        this.image = image;
        this.categoryName = categoryName;
    }

    @Override
    public String toString() {
        return "ProductBean{" +
                "id=" + id +
                ", productName='" + productName + '\'' +
                ", description='" + description + '\'' +
                ", quantity=" + quantity +
                ", price=" + price +
                ", image='" + image + '\'' +
                ", categoryName='" + categoryName + '\'' +
                '}';
    }
}
