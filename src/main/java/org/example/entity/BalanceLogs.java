package org.example.entity;

public class BalanceLogs implements java.io.Serializable {

    private int id;
    private Double amount;
    private String paymentType;

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public Double getAmount() {
        return amount;
    }
    public void setAmount(Double amount) {
        this.amount = amount;
    }

    public String getPaymentType() {
        return paymentType;
    }
    public void setPaymentType(String paymentType) {
        this.paymentType = paymentType;
    }
}
