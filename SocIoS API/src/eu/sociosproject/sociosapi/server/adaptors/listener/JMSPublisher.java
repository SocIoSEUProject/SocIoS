/*
 *  Copyright 2013 National Technical University of Athens
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 *
 */
 
package eu.sociosproject.sociosapi.server.adaptors.listener;
import java.util.logging.Logger;

import javax.jms.Connection;
import javax.jms.ConnectionFactory;
import javax.jms.Destination;
import javax.jms.MapMessage;
import javax.jms.Message;
import javax.jms.MessageProducer;
import javax.jms.ObjectMessage;
import javax.jms.QueueConnectionFactory;
import javax.jms.Session;
import javax.jms.TopicConnectionFactory;
import javax.naming.Context;
import javax.naming.InitialContext;

import eu.sociosproject.sociosapi.server.update.events.SociosEvent;

public class JMSPublisher {
	    //static ConnectionFactory cf = null;
	    //static Context ctx = null;
	    static final Logger logger = Logger.getLogger("JmsActionSender");

	    public void publishMessage(SociosEvent event) throws Exception {
	        try {

	            InitialContext context = new InitialContext();
	            QueueConnectionFactory cf = (QueueConnectionFactory) context.lookup("jms/UpdateQueueFactory");
	            Destination dest = (Destination) context.lookup("jms/UpdateQueue");
	            Connection conn = cf.createConnection();
	            Session jmsSession = conn.createSession(false, Session.AUTO_ACKNOWLEDGE);
	            MessageProducer producer = jmsSession.createProducer(dest);
	            ObjectMessage message = jmsSession.createObjectMessage(event);
	            
	            producer.send(message);
	            producer.close();
	            jmsSession.close();
	            conn.close();

	        } catch (Exception e) {
	            logger.info(e.getLocalizedMessage());
	            throw e;
	        }
	    }

}
