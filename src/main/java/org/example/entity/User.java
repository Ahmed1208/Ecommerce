package org.example.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.LazyToOne;
import org.hibernate.annotations.LazyToOneOption;

import java.io.Serializable;
import java.util.Date;
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

    @OneToOne(mappedBy = "user")
    @JoinColumn(nullable = false)
    private Address address;

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

    public User(String name, String email, String password, GENDER gender, Double balance, Date dateOfBirth, String phone) {
        super(name, email, password, gender);
        this.balance = balance;
        this.dateOfBirth = dateOfBirth;
        this.phone = phone;
    }
}
