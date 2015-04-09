package org.szx.modules.apartment.demos.jmx;


import javax.management.MBeanServer;
import javax.management.MBeanServerFactory;
import javax.management.ObjectName;

import com.sun.jdmk.comm.HtmlAdaptorServer;

public class HelloAgent {

	/**
	 * 运行程序后访问http://localhost:8082/
	 * @param args
	 * @throws Exception
	 */
	public static void main(String[] args) throws Exception {
        MBeanServer server = MBeanServerFactory.createMBeanServer();

        ObjectName helloName = new ObjectName("chengang:name=HelloWorld");
        server.registerMBean(new Hello(), helloName);

        ObjectName adapterName = new ObjectName("HelloAgent:name=htmladapter,port=8082");
        HtmlAdaptorServer adapter = new HtmlAdaptorServer();
        server.registerMBean(adapter, adapterName);

        adapter.start();
        System.out.println("start.....");

    }
}
