package org.example.dao;

import jakarta.persistence.Query;
import org.example.Factory;
import org.example.entity.Category;

import java.util.*;

public class CategoryDao extends Repository<Category> {

    public CategoryDao() {
        super(Category.class, Factory.entityManagerFactory.createEntityManager());
    }

    public boolean createCategory(Category category)
    {
        return true;
    }

    public Category getCategoryById(int id)
    {
        return null;
    }

    public List<Category> getAllCategories()
    {
        return new ArrayList<Category>();
    }

    public boolean updateCategory(Category category)
    {
        return false;
    }

    public boolean deleteCategory(int id)
    {
        return false;
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

    public void getCategory(Category c, Set<Category> categorySet)
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
            getCategory(i,categorySet);
        }

        //return

    }

    public List<Category> getSubCategoriesByCategory(Category parentCategory)
    {
        Set<Category> result = new HashSet<Category>();
        getCategory(parentCategory, result);
        result.remove(parentCategory);

        return new ArrayList<Category>(result);
    }

}