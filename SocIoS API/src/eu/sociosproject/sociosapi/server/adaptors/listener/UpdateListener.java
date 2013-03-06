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

import eu.sociosproject.sociosapi.server.update.events.SociosEvent;
import javax.ejb.ActivationConfigProperty;
import javax.ejb.MessageDriven;
import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageListener;
import javax.jms.ObjectMessage;


@MessageDriven(mappedName = "jms/UpdateQueue", activationConfig = {
    @ActivationConfigProperty(propertyName = "acknowledgeMode", propertyValue = "Auto-acknowledge"),
    @ActivationConfigProperty(propertyName = "destinationType", propertyValue = "javax.jms.Queue")
})
public class UpdateListener implements MessageListener {
    
    public UpdateListener() {
    }
    
    @Override
    public void onMessage(Message message) {
        
        if(message instanceof ObjectMessage) {
            
			ObjectMessage msg =  ( ObjectMessage ) message; 
        	try {
				SociosEvent event = (SociosEvent) msg.getObject();
				System.out.println("I got message with id " + event.getId().getId() );
			} catch (JMSException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
            
            //process SociosEvent
        }
    }
}