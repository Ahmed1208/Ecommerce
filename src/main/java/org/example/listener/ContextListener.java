package org.example.listener;

import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import org.example.entity.Category;
import org.example.mapper.CategoryPropertyEditor;
import org.example.mapper.LocalDatePropertyEditor;

import java.beans.PropertyEditorManager;
import java.time.LocalDate;

public class ContextListener implements ServletContextListener {


    //start up code
    @Override
    public void contextInitialized(ServletContextEvent sce)
    {
        System.out.println("DB connection will start here");

        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("ecommerce");

        sce.getServletContext().setAttribute("emf",entityManagerFactory);

        PropertyEditorManager.registerEditor(LocalDate.class, LocalDatePropertyEditor.class);
        PropertyEditorManager.registerEditor(Category.class, CategoryPropertyEditor.class);

    }

    @Override
    public void contextDestroyed(ServletContextEvent sce)
    {
        System.out.println("DB connection will be closed here");
        EntityManagerFactory emf = (EntityManagerFactory) sce.getServletContext().getAttribute("emf");
        emf.close();
    }

}
