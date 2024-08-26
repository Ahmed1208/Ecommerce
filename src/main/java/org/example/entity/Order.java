package org.example.entity;
import jakarta.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.Set;

@Entity
@Table(name = "orders")
public class Order implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name="total_price")
    private Double totalPrice;

    @Column(name="order_date")
    private Date orderDate;

    private String status;

    @Enumerated(EnumType.STRING)
    private PAYMENT paymentType;

    @ManyToOne
    private User user;

    @OneToMany(mappedBy = "order")
    private Set<OrderProductList> OrderProductList;




    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }

    public Double getTotalPrice() {
        return totalPrice;
    }
    public void setTotalPrice(Double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public Date getOrderDate() {
        return orderDate;
    }
    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }

    public PAYMENT getPaymentType() {
        return paymentType;
    }
    public void setPaymentType(PAYMENT paymentType) {
        this.paymentType = paymentType;
    }

    public User getUser() {
        return user;
    }
    public void setUser(User user) {
        this.user = user;
    }

    public Set<OrderProductList> getOrderProductList() {
        return OrderProductList;
    }
    public void setOrderProductList(Set<OrderProductList> orderProductList) {
        OrderProductList = orderProductList;
    }
}
