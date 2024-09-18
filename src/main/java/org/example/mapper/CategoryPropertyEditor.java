package org.example.mapper;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import org.example.Factory;
import org.example.dao.CategoryDao;
import org.example.dao.ProductDao;
import org.example.entity.Category;
import org.example.listener.ContextListener;

import java.beans.PropertyEditorSupport;
import java.util.Optional;

public class CategoryPropertyEditor extends PropertyEditorSupport {
    // Simulating retrieval from a database or service
    private Category getCategoryByName(String categoryName) {
        // This is just a stub; replace with actual category lookup logic
        EntityManagerFactory emf = (EntityManagerFactory) ContextListener.getServletContext().getAttribute("emf");
        EntityManager em = emf.createEntityManager();
        CategoryDao categoryDao = new CategoryDao(em);

        Optional<Category> category= categoryDao.findCategoryByName(categoryName);

        return category.orElse(null);
    }

    @Override
    public void setAsText(String text) throws IllegalArgumentException {
        if (text == null || text.isEmpty()) {
            setValue(null);  // If the input is null or empty, set Category as null
        } else {
            try {
                Category category = getCategoryByName(text);
                setValue(category);  // Set the Category object
            } catch (NumberFormatException e) {
                throw new IllegalArgumentException("Invalid category ID: " + text);
            }
        }
    }

    @Override
    public String getAsText() {
        Category category = (Category) getValue();
        return (category != null) ? String.valueOf(category.getName()) : "";
    }




}
