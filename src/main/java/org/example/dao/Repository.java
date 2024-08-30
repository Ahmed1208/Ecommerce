package org.example.dao;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Root;

import java.util.List;

public abstract class Repository<T> {
    private final Class<T> className;
    protected EntityManager entityManager;

    public Repository(Class<T> className, EntityManager entityManager)
    {
        this.entityManager=entityManager;
        this.className = className;
    }

    public T findById(int id)
    {
        return entityManager.find(className, id);
    }

    public List<T> findAll()
    {
        TypedQuery<T> query = entityManager.createQuery("select s from "+className +" s",className);
        return query.getResultList();
    }

    public boolean delete(int id)
    {
        return entityManager.createQuery("delete from "+className +" u  where u.id = :id")
                .setParameter("id", id).executeUpdate() == 1;
    }

    public boolean insert(T t)
    {
        try{
            entityManager.persist(t);
            entityManager.flush();
            return true;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }

    }
    public boolean update(T t)
    {
        try{
            entityManager.merge(t);
            entityManager.flush();
            return true;

        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }

    protected <G> List<T> findBy(String ColumnName,G value)
    {

        CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
        CriteriaQuery<T> criteriaQuery = criteriaBuilder.createQuery(className);
        Root<T> root = criteriaQuery.from(className);

        criteriaQuery.select(root).where(criteriaBuilder.equal(root.get(ColumnName),value));
        return entityManager.createQuery(criteriaQuery).getResultList();
    }
}
