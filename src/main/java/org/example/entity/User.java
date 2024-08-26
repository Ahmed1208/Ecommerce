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
    private Integer id;

    private Double balance;
    private String address;
    private Date dateOfBirth;
    private String phone;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
    private Set<BalanceLogs> balanceLogs;

    @OneToMany(mappedBy = "user")
    private Set<Order> orders;

    @ManyToMany(fetch=FetchType.LAZY)
    @JoinTable(name="user_has_interests", catalog="ecommerce", joinColumns = {
            @JoinColumn(name="user_id", nullable=false) }, inverseJoinColumns = {
            @JoinColumn(name="interest_id", nullable=false) })
    private Set<Interest> interests;
    @OneToMany(mappedBy = "user")
    private Set<UserProductCart> userProductCarts;



    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
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

    public Set<Interest> getInterests() {
        return interests;
    }
    public void setInterests(Set<Interest> interests) {
        this.interests = interests;
    }

    public Set<Order> getOrders() {
        return orders;
    }
    public void setOrders(Set<Order> orders) {
        this.orders = orders;
    }

    public Set<UserProductCart> getUserProductCarts() {
        return userProductCarts;
    }

    public void setUserProductCarts(Set<UserProductCart> userProductCarts) {
        this.userProductCarts = userProductCarts;
    }


}
