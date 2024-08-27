package org.example;

import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class Factory {

    static final public EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("ecommerce");
}
