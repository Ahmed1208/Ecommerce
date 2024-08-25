package org.example.entity;
import jakarta.persistence.*;

import java.io.Serializable;

@Entity
@Table(name="admin")
public class Admin extends Person implements Serializable {

    @Id
    @GeneratedValue (strategy = GenerationType.AUTO)
    private int id;


    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

}
