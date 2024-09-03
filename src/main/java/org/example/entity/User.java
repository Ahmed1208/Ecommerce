package org.example.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.LazyToOne;
import org.hibernate.annotations.LazyToOneOption;

import java.io.Serializable;
import java.util.Date;
import java.util.Objects;
import java.util.Set;

@Entity
@Table(name = "user")
@Setter
@Getter
@NoArgsConstructor
public class User extends Person implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private double balance;

    //will be eager by default
    @OneToOne(mappedBy = "user" ,cascade = CascadeType.ALL,orphanRemoval = true)
    @JoinColumn(nullable = false)
    private Address address;

    private Date dateOfBirth;
    private String phone;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
    private Set<BalanceLogs> balanceLogs;

    @OneToMany(mappedBy = "user",fetch = FetchType.LAZY)
    private Set<Order> orders;

    @ManyToMany(fetch=FetchType.LAZY)
    @JoinTable(name="user_has_interests", catalog="ecommerce", joinColumns = {
            @JoinColumn(name="user_id", nullable=false) }, inverseJoinColumns = {
            @JoinColumn(name="interest_id", nullable=false) })
    private Set<Interest> interests;


    @OneToMany(mappedBy = "user",fetch = FetchType.LAZY)
    private Set<UserProductCart> userProductCarts;

    public User(String name, String email, String password, GENDER gender, Double balance, Date dateOfBirth, String phone) {
        super(name, email, password, gender);
        this.balance = balance;
        this.dateOfBirth = dateOfBirth;
        this.phone = phone;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        User user = (User) o;
        return Double.compare(balance, user.balance) == 0 && Objects.equals(id, user.id) && Objects.equals(address, user.address) && Objects.equals(dateOfBirth, user.dateOfBirth) && Objects.equals(phone, user.phone) && Objects.equals(balanceLogs, user.balanceLogs) && Objects.equals(orders, user.orders) && Objects.equals(interests, user.interests) && Objects.equals(userProductCarts, user.userProductCarts);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, balance, address, dateOfBirth, phone, balanceLogs, orders, interests, userProductCarts);
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", balance=" + balance +
                ", address=" + address +
                ", dateOfBirth=" + dateOfBirth +
                ", phone='" + phone + '\'' +
                '}';
    }
}
