package org.example.entity;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;
import java.util.Date;
import java.util.Objects;
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

    @Enumerated(EnumType.STRING)
    @Column(nullable=false)
    private STATUS status;

    @Enumerated(EnumType.STRING)
    @Column(nullable=false)
    private PAYMENT paymentType;

    @ManyToOne
    @JoinColumn(nullable=false)
    private User user;

    @OneToMany(mappedBy = "order")
    private Set<OrderProductList> OrderProductList;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Order order = (Order) o;
        return Objects.equals(id, order.id) && Objects.equals(totalPrice, order.totalPrice) && Objects.equals(orderDate, order.orderDate) && status == order.status && paymentType == order.paymentType && Objects.equals(user, order.user) && Objects.equals(OrderProductList, order.OrderProductList);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, totalPrice, orderDate, status, paymentType, user, OrderProductList);
    }


    @Override
    public String toString() {
        return "Order{" +
                "id=" + id +
                ", totalPrice=" + totalPrice +
                ", orderDate=" + orderDate +
                ", status=" + status +
                ", paymentType=" + paymentType +
                ", user_id=" + user.getId() +
                '}';
    }
}
