package com.bit.market.repository;

import com.bit.market.domain.Cart;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CartRepository extends JpaRepository<Cart,Integer> {

    List<Cart> findByUserId(Integer userId);

    void deleteByUserIdAndGoodsId(Integer userId , Integer goodsId);

}
