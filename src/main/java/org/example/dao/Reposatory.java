package org.example.dao;

import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Predicate;
import jakarta.persistence.criteria.Root;
import org.example.Factory;

import java.util.List;

public abstract class Reposatory<T> {

    public Class<T> className;

    public Reposatory(Class<T> className)
    {
        this.className = className;
    }


    public T findById(int id)
    {

        CriteriaBuilder criteriaBuilder = Factory.entityManager.getCriteriaBuilder();
        CriteriaQuery<T> criteriaQuery = criteriaBuilder.createQuery(className);
        Root<T> root = criteriaQuery.from(className);

        criteriaQuery.select(root).where(criteriaBuilder.equal(root.get("id"),id));
        return Factory.entityManager.createQuery(criteriaQuery).getSingleResult();
    }

    public <G> T findById(String columnName,G g)
    {

        CriteriaBuilder criteriaBuilder = Factory.entityManager.getCriteriaBuilder();
        CriteriaQuery<T> criteriaQuery = criteriaBuilder.createQuery(className);
        Root<T> root = criteriaQuery.from(className);

        criteriaQuery.select(root).where(criteriaBuilder.equal(root.get(columnName),g));
        return Factory.entityManager.createQuery(criteriaQuery).getSingleResult();
    }

    public List<T> findAll()
    {
        CriteriaBuilder criteriaBuilder = Factory.entityManager.getCriteriaBuilder();
        CriteriaQuery<T> criteriaQuery = criteriaBuilder.createQuery(className);
        Root<T> root = criteriaQuery.from(className);

        criteriaQuery.select(root);
        return Factory.entityManager.createQuery(criteriaQuery).getResultList();
    }

    public boolean insert(T t)
    {
        return true;
    }

    public boolean deleteById(int id)
    {
        return true;
    }

    public boolean updateById(T t,int id)
    {
        return true;
    }





}
