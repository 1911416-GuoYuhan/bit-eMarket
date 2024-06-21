package com.bit.market.domain;

import javax.persistence.*;


@Entity
public class Cart {

    @Id
    @GeneratedValue()
    private Integer id;

    private Integer userId;

    private Integer goodsId;

    public Cart(Integer id, Integer userId, Integer goodsId) {
        this.id = id;
        this.userId = userId;
        this.goodsId = goodsId;
    }

    public Cart() {

    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }
}
