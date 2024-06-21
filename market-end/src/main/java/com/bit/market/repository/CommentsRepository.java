package com.bit.market.repository;

import com.bit.market.domain.Comments;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CommentsRepository extends JpaRepository<Comments,Integer>{

    List<Comments> findByGoodsId(Integer goodsId);

}

