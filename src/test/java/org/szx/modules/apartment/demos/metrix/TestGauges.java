package org.szx.modules.apartment.demos.metrix;

import java.util.LinkedList;
import java.util.Queue;
import java.util.concurrent.TimeUnit;
 




import org.junit.Test;

import com.yammer.metrics.Metrics;
import com.yammer.metrics.core.Counter;
import com.yammer.metrics.core.Gauge;
import com.yammer.metrics.core.Meter;
import com.yammer.metrics.reporting.ConsoleReporter;
 
/**
 * TODO
 * @author scutshuxue.chenxf
 */
public class TestGauges {
        @Test
        public void testGauge() throws InterruptedException{
        	final Queue<String> queue = new LinkedList<String>();
            ConsoleReporter.enable(1,TimeUnit.SECONDS);
 
            Metrics.newGauge(TestGauges.class, "pending-jobs", new Gauge<Integer>() {
               @Override
               public Integer value() {
                   return queue.size();
               }
           });
           queue.add("ssss");
           while(true){
                   Thread.sleep(3000);
                   break;
           }
        }
        
        @Test
        public void testMark() throws InterruptedException{
        	Meter meter = Metrics.newMeter(TestGauges.class, "requests","requests", TimeUnit.SECONDS); 
        	ConsoleReporter.enable(1,TimeUnit.SECONDS);  
            for(int i=0;i<3;i++){  
                    meter.mark();  
                    meter.mark();  
                    Thread.sleep(1000);  
            }  
        }
}
