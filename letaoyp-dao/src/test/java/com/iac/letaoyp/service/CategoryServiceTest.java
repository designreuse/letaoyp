package com.iac.letaoyp.service;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.function.Consumer;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.junit.Test;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springside.modules.test.spring.SpringTransactionalTestCase;

@ContextConfiguration(locations = { "classpath:spring/applicationContext*.xml" })
@TransactionConfiguration(defaultRollback=false)
public class CategoryServiceTest extends SpringTransactionalTestCase {

	@Test
	public void parseHtml() throws IOException {
		Resource resource = new ClassPathResource("data/src_category.html");
		ByteArrayOutputStream bos = new ByteArrayOutputStream();
		IOUtils.copy(resource.getInputStream(), bos);
		
		Document doc = new Document(bos.toString("utf-8"));
		
		// 指定1 图片
		doc.select("div.fr .cxjinfo .cxjitem").forEach(new Consumer<Element>() {

			@Override
			public void accept(Element t) {
				String toplevel1Image = t.select("a img").attr("src");
				
				//of course we need to get goods information
			}
		});
		
		doc.select(".ipl").forEach(new Consumer<Element>() {

			@Override
			public void accept(Element t) {
				String rootCategoryName = t.select(".psp h2 span").text();
				
				t.select(".psp .i_prclist .cxjitem").forEach(new Consumer<Element>() {

					@Override
					public void accept(Element t2) {
						//generator goods
						String image = t2.select("div.p a img").attr("src");
						String name = t2.select("div.i h3 a").attr("title");
						Elements es = t2.select("div.i ul");
						String salesPriceStr = es.select("li.gel-price em").text();
						String marketPriceStr = es.select("li.gel-mktprice del").text();
						int salesPrice = Integer.valueOf(StringUtils.substring(salesPriceStr, 1));
						int marketPrice = Integer.valueOf(StringUtils.substring(marketPriceStr, 1));
						
					}
					
				});
			}
			
		});
	}
	
}
