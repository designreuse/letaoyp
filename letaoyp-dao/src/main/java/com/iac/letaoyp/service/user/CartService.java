package com.iac.letaoyp.service.user;

import java.util.Collections;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springside.modules.utils.Collections3;

import com.iac.letaoyp.entity.sku.Goods;
import com.iac.letaoyp.entity.sku.GoodsChoosen;
import com.iac.letaoyp.entity.user.Cart;
import com.iac.letaoyp.entity.user.CartItem;
import com.iac.letaoyp.entity.user.Member;
import com.iac.letaoyp.repository.BasicRepository;
import com.iac.letaoyp.repository.sku.GoodsChoosenDao;
import com.iac.letaoyp.repository.sku.GoodsDao;
import com.iac.letaoyp.repository.user.CartDao;
import com.iac.letaoyp.repository.user.CartItemDao;
import com.iac.letaoyp.service.BasicService;

@Component
@Transactional
public class CartService extends BasicService<Cart,java.lang.Long> {

	@Autowired
	private CartDao cartDao;
	@Autowired
	private GoodsDao goodsDao;
	@Autowired
	private CartItemDao cartItemDao;
	@Autowired
	private GoodsChoosenDao goodsChoosenDao;
	
	@Override
	public BasicRepository<Cart,java.lang.Long> getRepository() {
		return cartDao;
	}

	public CartItem addCart(Member member, Long goods, Long[] choosen, int quantity) {
		Cart cart = this.findByMember(member);
		if(cart == null) {
			cart = new Cart();
			cart.setMember(member);
			cartDao.save(cart);
		}
		
		CartItem item = new CartItem();
		item.setCart(cart);
		item.setGoods(goodsDao.findOne(goods));
		item.setQuantity(quantity);
		
		List<GoodsChoosen> goodsChoosen;
		if(choosen.length > 0) {
			goodsChoosen = goodsChoosenDao.findByIdIn(choosen);
			item.setChoosen(StringUtils.join(choosen, ","));
			item.setChoosenDescription(Collections3.extractToMap(goodsChoosen, "name", "value"));
		} else {
			goodsChoosen = Collections.EMPTY_LIST;
		}
		item.setPrice(computePrice(item.getGoods(), goodsChoosen));
		
		cartItemDao.save(item);
		return item;
	}

	/**
	 * 计算商品价格 以后再支持更多的算法
	 * @param goods
	 * @param goodsChoosen
	 * @return
	 */
	private Long computePrice(Goods goods, List<GoodsChoosen> goodsChoosen) {
		long p = goods.getSalesPrice();
		for(GoodsChoosen gc : goodsChoosen) {
			p += gc.getCost();
		}
		return p;
	}

	public Cart findByMember(Member member) {
		Cart cart = cartDao.findByMemberId(member.getId());
		
		if(cart == null) {
			cart = new Cart();
			cart.setMember(member);
			cartDao.save(cart);
		}
		return cart;
	}
	
	public void updateActiveByIds(boolean active, Long[] ids) {
		cartDao.updateActiveByIdIn(active, ids);
	}

	public void delete(Long[] ids) {
		cartDao.deleteByIdIn(ids);
	}

	public Cart findByMemberWhitItems(Member member) {
		Cart cart = findByMember(member);
		
		List<CartItem> items = cartItemDao.findByCartId(cart.getId());
		cart.setItems(items);
		return cart;
	}
}
