package com.iac.letaoyp;

import org.springframework.context.annotation.Profile;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springside.modules.test.spring.SpringTransactionalTestCase;

@ContextConfiguration(locations = { "classpath:spring/applicationContext*.xml" })
@TransactionConfiguration(defaultRollback=false)
@Profile("test")
public class CommitTransactionBaseTest extends SpringTransactionalTestCase {

}
