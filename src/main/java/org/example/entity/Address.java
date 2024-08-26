package org.example.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;


@Entity
@Table(name= "address")
@Getter
@Setter
public class Address implements Serializable {

    @Id
    private Integer id;

    private String street;
    private String city;
    private String country;

    @OneToOne
    @MapsId
    private User user;


}
