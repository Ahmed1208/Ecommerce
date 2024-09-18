package org.example.service;

import jakarta.persistence.EntityManager;
import jakarta.servlet.annotation.WebServlet;
import org.example.dao.BalanceLogsDao;
import org.example.entity.BalanceLogs;

import java.util.List;
public class BalanceLogsService {
    EntityManager entityManager;
    BalanceLogsDao balanceLogsDao;

   public BalanceLogsService(EntityManager em) {
       entityManager = em;
       this.balanceLogsDao = new BalanceLogsDao(entityManager);
    }
    public List<BalanceLogs> getUserBalanceLogs(int userId) {
        return balanceLogsDao.findBalanceLogsByUser(userId);
    }


}
