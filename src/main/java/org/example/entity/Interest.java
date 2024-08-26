package org.example.entity;

import jakarta.persistence.*;

import java.util.Set;

@Entity
@Table(name="interest")
public class Interest implements java.io.Serializable {

    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)
    private Integer id;
    private String name;

    @ManyToMany(fetch=FetchType.LAZY)
    @JoinTable(name="user_has_interests", catalog="ecommerce", joinColumns = {
            @JoinColumn(name="interest_id", nullable=false) }, inverseJoinColumns = {
            @JoinColumn(name="user_id", nullable=false) })
    private Set<User> users;




    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    public Set<User> getUsers() {
        return users;
    }
    public void setUsers(Set<User> users) {
        this.users = users;
    }
}
