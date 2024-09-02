package org.example.dao;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;
import org.example.Factory;
import org.example.entity.Category;

import java.util.*;

public class CategoryDao extends Repository<Category> {

    public CategoryDao(EntityManager entityManager) {
        super(Category.class, entityManager);
    }


    public Category findCategoryByName(String categoryName) {
        return findBy("name",categoryName).get(0);
    }

    public List<Category> getParentCategories()
    {
        String s = "from Category c where c.parentCategory = null";
        Query q = entityManager.createQuery(s);
        return q.getResultList();
    }

    public List<Category> getSubCategories()
    {
        String s = "from Category c where c.parentCategory != null";
        Query q = entityManager.createQuery(s);
        return q.getResultList();
    }

    public void extractCategory(Category c, Set<Category> categorySet)
    {
        categorySet.add(c);
        //base cases
        if(c.getChildCategories().size() == 0)
        {
            return;
        }

        //call
        for(Category i : c.getChildCategories())
        {
            extractCategory(i,categorySet);
        }

        //return

    }

    public List<Category> getSubCategoriesByCategory(Category parentCategory)
    {
        Set<Category> result = new HashSet<Category>();
        extractCategory(parentCategory, result);
        result.remove(parentCategory);

        return new ArrayList<Category>(result);
    }

}