package org.example.dao;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Root;
import jakarta.transaction.Transactional;

import java.util.List;
import java.util.Optional;

public abstract class Repository<T> {
    private final Class<T> className;
    protected EntityManager entityManager;

    public Repository(Class<T> className, EntityManager entityManager)
    {
        this.entityManager=entityManager;
        this.className = className;
    }

    public Optional<T> findById(int id)
    {
        return Optional.ofNullable( entityManager.find(className, id) );
    }

    public List<T> findAll()
    {
        TypedQuery<T> query = entityManager.createQuery("select s from "+className.getSimpleName() +" s",className);
        return query.getResultList();
    }
    public boolean delete(int id)
    {
            int row= entityManager.createQuery("delete from "+className.getSimpleName() +" u  where u.id = :id")
                    .setParameter("id", id).executeUpdate();
            return row == 1;
    }

    public void create(T t)
    {
        entityManager.persist(t);
    }

    public void update(T t)
    {
        entityManager.merge(t);
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
