package org.example.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.Setter;

import java.io.Serializable;

@Entity
@Table(name = "balance_logs")
@Setter
@Getter
@NoArgsConstructor
public class BalanceLogs implements Serializable {

    @Id
    private Integer id;

    @Column(nullable = false)
    private Double amount;

    @Enumerated(EnumType.STRING)
    @Column(name="payment_type",nullable = false)
    private PAYMENT paymentType;

    @ManyToOne(fetch = FetchType.LAZY)
    @MapsId("id")    //this id is refering to the Integer id here in this class
    private User user;

    public BalanceLogs(Double amount, PAYMENT paymentType, User user) {
        this.amount = amount;
        this.paymentType = paymentType;
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
