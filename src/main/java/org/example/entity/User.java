package org.example.entity;

import java.io.Serializable;
import java.util.Date;

public class User extends Person implements Serializable {

    private int id;
    private Double balance;
    private String address;
    private Date dateOfBirth;
    private String phone;


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
}
