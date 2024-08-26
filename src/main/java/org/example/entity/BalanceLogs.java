package org.example.entity;

import jakarta.persistence.*;

import java.io.Serializable;

@Entity
@Table(name = "balance_logs")
public class BalanceLogs implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private Double amount;

    @Enumerated(EnumType.STRING)
    @Column(name="payment_type")
    private PAYMENT paymentType;

    @ManyToOne
    private User user;



    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }

    public Double getAmount() {
        return amount;
    }
    public void setAmount(Double amount) {
        this.amount = amount;
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



    @Override
    public String toString() {
        return "BalanceLogs{" +
                "id=" + id +
                ", amount=" + amount +
                ", paymentType='" + paymentType + '\'' +
                ", user=" + user.getId() +
                '}';
    }
}
