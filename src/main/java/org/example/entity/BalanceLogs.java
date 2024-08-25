package org.example.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "balance_logs")
public class BalanceLogs implements java.io.Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private Double amount;
    private String paymentType;
    @ManyToOne
    private User user;
    public BalanceLogs() {}

    public BalanceLogs(Double amount, String paymentType, User user) {
        this.amount = amount;
        this.paymentType = paymentType;
        this.user = user;
    }

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public Double getAmount() {
        return amount;
    }
    public void setAmount(Double amount) {
        this.amount = amount;
    }

    public String getPaymentType() {
        return paymentType;
    }
    public void setPaymentType(String paymentType) {
        this.paymentType = paymentType;
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
