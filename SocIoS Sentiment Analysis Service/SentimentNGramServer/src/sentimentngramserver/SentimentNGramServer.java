/*
*    This file is part of SocIoS Sentiment Analysis Service.
*
*    SocIoS Sentiment Analysis Service is free software: you can redistribute it and/or modify
*    it under the terms of the GNU General Public License as published by
*    the Free Software Foundation, either version 3 of the License, or
*    (at your option) any later version.
*
*    SocIoS Sentiment Analysis Service is distributed in the hope that it will be useful,
*    but WITHOUT ANY WARRANTY; without even the implied warranty of
*    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
*    GNU General Public License for more details.
*
*    You should have received a copy of the GNU General Public License
*    along with SocIoS Sentiment Analysis Service.  If not, see <http://www.gnu.org/licenses/>.
 *
 */
 
 package sentimentngramserver;

import gr.ntua.sentimentanalysis.SentimentAnalysisBean;
import javax.xml.ws.Endpoint;

/**
 *
 * @author Thanos
 */
public class SentimentNGramServer {

    public static void main(String[] args) throws InterruptedException {

        new SentimentNGramServer();
        System.out.println("Server ready...");

        Thread.sleep(Long.MAX_VALUE);
        System.out.println("Server exiting");
        System.exit(0);
    }


    public SentimentNGramServer() {

        Object implementor = new SentimentAnalysisBean();
        String address = "http://0.0.0.0:8080/ngram/";
        Endpoint.publish(address, implementor);

    }
}
