package org.example.entity;

import jakarta.persistence.*;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

@Entity
@Table(name = "user")
public class User extends Person implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private Double balance;
    private String address;
    private Date dateOfBirth;
    private String phone;
    @OneToMany(mappedBy = "user")
    private Set<BalanceLogs> balanceLogs;

    public User() {}

    public User(Double balance, String phone) {
        this.balance = balance;
        this.phone = phone;
    }

    public User(Double balance, String address, Date dateOfBirth, String phone) {
        this.balance = balance;
        this.address = address;
        this.dateOfBirth = dateOfBirth;
        this.phone = phone;
    }

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public Double getBalance() {
        return balance;
    }
    public void setBalance(Double balance) {
        this.balance = balance;
    }

    public String getAddress() {
        return address;
    }
    public void setAddress(String address) {
        this.address = address;
    }

    public Date getDateOfBirth() {
        return dateOfBirth;
    }
    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getPhone() {
        return phone;
    }
    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Set<BalanceLogs> getBalanceLogs() {
        return balanceLogs;
    }

    public void setBalanceLogs(Set<BalanceLogs> balanceLogs) {
        this.balanceLogs = balanceLogs;
    }
}
