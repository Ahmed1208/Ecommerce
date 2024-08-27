package org.example.entity;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;

@Entity
@Table(name = "order_product_list")
@Setter
@Getter
@NoArgsConstructor
public class OrderProductList  implements Serializable {

    @EmbeddedId
    @AttributeOverrides( {
            @AttributeOverride(name="orderId", column=@Column(name="order_id", nullable=false,insertable=false, updatable=false) ),
            @AttributeOverride(name="productId", column=@Column(name="product_id", nullable=false,insertable=false, updatable=false) ) } )
    private OrderProductId orderProductId;

    @Column(name="product_quantity",nullable=false)
    private Integer productQuantity;

    @Column(name="product_price",nullable = false)
    private Double productPrice;

    @ManyToOne
    @JoinColumn(nullable = false)
    private Product product;

    @ManyToOne
    @JoinColumn(nullable=false)
    private Order order;






}
