package org.example.entity;
import jakarta.persistence.*;

import java.io.Serializable;

@Entity
@Table(name="admin")
public class Admin extends Person implements Serializable {

    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)
    private Integer id;


    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }

}
