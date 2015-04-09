package org.szx.modules.apartment.entity;

import org.junit.Assert;
import org.junit.Test;
import org.szx.modules.apartment.entity.CustomerType;

public class CustomerTypeTest {

	@Test
	public void testValueOf(){
		Assert.assertEquals(CustomerType.NORMAL,CustomerType.valueOf("NORMAL"));
	}
	@Test
	public void testToString(){
		Assert.assertEquals("NORMAL",CustomerType.NORMAL);
	}
}
