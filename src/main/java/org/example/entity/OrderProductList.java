package org.example.entity;
import jakarta.persistence.*;

import java.io.Serializable;

@Entity
@Table(name = "order_product_list")
public class OrderProductList  implements Serializable {

    @EmbeddedId
    @AttributeOverrides( {
            @AttributeOverride(name="orderId", column=@Column(name="order_id", nullable=false,insertable=false, updatable=false) ),
            @AttributeOverride(name="productId", column=@Column(name="product_id", nullable=false,insertable=false, updatable=false) ) } )
    private OrderProductId orderProductId;

    @Column(name="product_quantity")
    private Integer productQuantity;

    @Column(name="product_price")
    private Double productPrice;

    @ManyToOne
    private Product product;
    @ManyToOne
    private Order order;


    public Integer getProductQuantity() {
        return productQuantity;
    }

    public void setProductQuantity(Integer productQuantity) {
        this.productQuantity = productQuantity;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public OrderProductList(OrderProductId orderProductId, Integer productQuantity, Double productPrice) {
        this.orderProductId = orderProductId;
        this.productQuantity = productQuantity;
        this.productPrice = productPrice;
    }
    public OrderProductList() {}

    public OrderProductId getOrderProductId() {
        return orderProductId;
    }
    public void setOrderProductId(OrderProductId orderProductId) {
        this.orderProductId = orderProductId;
    }

    public Integer getproductQuantity() {
        return productQuantity;
    }
    public void setproductQuantity(Integer productQuantity) {
        this.productQuantity = productQuantity;
    }

    public Double getProductPrice() {
        return productPrice;
    }
    public void setProductPrice(Double productPrice) {
        this.productPrice = productPrice;
    }

}
