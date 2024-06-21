package com.bit.market.repository;

import com.bit.market.domain.Trade;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface TradeRepository extends JpaRepository<Trade,Integer> {

    List<Trade> findByBuyerId(Integer buyerId);

    List<Trade> findByBuyerIdAndStatus(Integer buyerId, Integer status);

    Trade findByGoodsId(Integer goodsId);

    void deleteByGoodsId(Integer goodsId);
}
