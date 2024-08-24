package org.example;

import java.util.LinkedHashSet;
import java.util.Set;

public class Category {

    Integer id;
    String name;
    int parentCategoryId;

    Set<Product> productSet = new LinkedHashSet<Product>();

}
