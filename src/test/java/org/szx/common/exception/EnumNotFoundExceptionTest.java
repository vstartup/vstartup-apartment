package org.szx.common.exception;

import org.junit.Assert;
import org.junit.Test;
import org.szx.common.exception.EnumNotFoundException;

public class EnumNotFoundExceptionTest {

	@Test
	public void testMessage(){
		try{
			throw new EnumNotFoundException("CustomerStatus",2);
		}catch(Exception e){
			Assert.assertEquals("Can not found enum {CustomerStatus} us code[{2}]", e.getMessage());
		}
	}
}
