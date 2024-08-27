package org.example.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;


@Entity
@Table(name= "address")
@Getter
@Setter
@NoArgsConstructor
public class Address implements Serializable {

    @Id
    private Integer id;

    @Column(nullable=false)
    private String street;

    @Column(nullable=false)
    private String city;

    @Column(nullable=false)
    private String country;

    @OneToOne
    @MapsId
    private User user;


}
