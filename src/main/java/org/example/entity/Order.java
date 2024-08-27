package org.example.entity;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

@Entity
@Table(name = "orders")
@Setter
@Getter
@NoArgsConstructor
public class Order implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name="total_price",nullable=false)
    private Double totalPrice;

    @Column(name="order_date",nullable=false)
    private Date orderDate;

    @Column(nullable=false)
    private String status;

    @Enumerated(EnumType.STRING)
    @Column(nullable=false)
    private PAYMENT paymentType;

    @ManyToOne
    @JoinColumn(nullable=false)
    private User user;

    @OneToMany(mappedBy = "order")
    private Set<OrderProductList> OrderProductList;




   }
