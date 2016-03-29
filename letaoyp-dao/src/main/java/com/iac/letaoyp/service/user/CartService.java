package com.iac.letaoyp.service.user;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springside.modules.utils.Collections3;

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

	public void addCart(Member member, Long goods, Long[] choosen, int quantity) {
		Cart cart = cartDao.findByMemberId(member.getId());
		if(cart == null) {
			cart = new Cart();
			cart.setMember(member);
			cartDao.save(cart);
		}
		
		CartItem item = new CartItem();
		item.setCart(cart);
		item.setGoods(goodsDao.findOne(goods));
		item.setQuantity(quantity);
		
		List<GoodsChoosen> goodsChoosen = goodsChoosenDao.findByIdIn(choosen);
		item.setChoosen(StringUtils.join(choosen, ","));
		
		item.setChoosenDescription(Collections3.extractToMap(goodsChoosen, "name", "value"));
		cartItemDao.save(item);
	}

	public Cart findByMemberId(Long id) {
		return cartDao.findByMemberId(id);
	}
	
	public void updateActiveByIds(boolean active, Long[] ids) {
		cartDao.updateActiveByIdIn(active, ids);
	}

	public void delete(Long[] ids) {
		cartDao.deleteByIdIn(ids);
	}
}
