package org.example.dao;

import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import org.example.entity.BalanceLogs;

import java.util.List;

public class BalanceLogsDao extends Repository<BalanceLogs> {


    public BalanceLogsDao(EntityManager entityManager)
    {
        super(BalanceLogs.class,entityManager);
    }

    public List<BalanceLogs> findBalanceLogsByUser(Integer userId)
    {
        String s = "from BalanceLogs b where b.user.id = :userId";
        Query q = entityManager.createQuery(s).setParameter("userId",userId);
        return q.getResultList();
    }


}
