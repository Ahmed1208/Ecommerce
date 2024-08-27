package org.example.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;
import java.util.Set;

@Entity
@Table(name="product")
@Setter
@Getter
@NoArgsConstructor
public class Product implements Serializable {

    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name="product_name",nullable = false,unique = true)
    private String productName;
    private String description;
    @Column(nullable = false)
    private Integer quantity;
    @Column(nullable = false)
    private Double price;
    private String image;

    @ManyToOne
    @JoinColumn(nullable=false)
    private Category category;

    @OneToMany(mappedBy = "product")
    private Set<OrderProductList> OrderProductList;

    @OneToMany(mappedBy = "product")
    private Set<UserProductCart> userProductCarts;


}
