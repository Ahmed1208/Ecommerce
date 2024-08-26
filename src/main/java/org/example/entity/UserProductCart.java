package org.example.entity;


import jakarta.persistence.*;

import java.io.Serializable;

@Entity
@Table(name = "user_product_cart")
public class UserProductCart  implements Serializable {


    @EmbeddedId
    @AttributeOverrides( {
            @AttributeOverride(name="userId", column=@Column(name="user_id", nullable=false,insertable=false, updatable=false) ),
            @AttributeOverride(name="productId", column=@Column(name="product_id", nullable=false,insertable=false, updatable=false) ) } )
    private UserProductId userProductId;

    @Column(name="product_quantity")
    private Integer productQuantity;
    @ManyToOne
    private Product product;
    @ManyToOne
    private User user;

    public UserProductCart(UserProductId userProductId, Integer productQuantity) {
        this.userProductId = userProductId;
        this.productQuantity = productQuantity;
    }
    public UserProductCart() {}

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public UserProductId getUserProductId() {
        return userProductId;
    }
    public void setUserProductId(UserProductId userProductId) {
        this.userProductId = userProductId;
    }

    public Integer getProductQuantity() {
        return productQuantity;
    }
    public void setProductQuantity(Integer productQuantity) {
        this.productQuantity = productQuantity;
    }


}
