package org.example.dao;

import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import org.example.entity.Address;

import java.util.Optional;

public class AddressDao extends Repository<Address> {

    private EntityManager entityManager;

    public AddressDao(EntityManager entityManager)
    {
        super(Address.class,entityManager);
    }

    public Optional<Address> findAddressByUser(Integer userId)
    {
        String s = "from Address a where a.user.id = :userId";
        Query q = entityManager.createQuery(s).setParameter("userId",userId);
        return Optional.ofNullable( (Address) q.getSingleResult() );
    }
}
