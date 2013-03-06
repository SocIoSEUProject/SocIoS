/*
Copyright (c) 2002 JSON.org

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

The Software shall be used for Good, not Evil.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

package eu.sociosproject.sociosapi.coreutilities.networkutilities.JSONUtilities;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import eu.sociosproject.sociosapi.coreutilities.networkutilities.HttpRequests;

/**
 *
 * @author ang
 */
public class JSONmerge {

	private final static Logger logger = LoggerFactory.getLogger(JSONmerge.class);
	String debug="";
	
    ArrayList<String> Social_Networks = new ArrayList();
    Integer counter = 0;
    Integer MaxCount = 0;
    JSONObject JSONtmp1 = new JSONObject();
    JSONArray JSONtmp2 = new JSONArray();
    JSONArray thefinalJSONArray = new JSONArray();
    JSONObject thefinalJSON = new JSONObject();
    
    //constructor of JSONmerge
    public JSONmerge() {
    }

	public void orderAnswerJSONArray(String args, String socialNetwork)
			throws JSONException {
		JSONObject jObj = new JSONObject(socialNetwork);		
		JSONArray jArray = jObj.getJSONArray(args);

		for(int i = 0; i < jArray.length(); i++){
			thefinalJSONArray.put(jArray.getJSONObject(i));
		}

	}

	public void orderAnswerJSONObject(String args, String socialNetwork)
			throws JSONException {
		JSONtmp1 = new JSONObject(socialNetwork);
		if(args != null && !args.isEmpty()){
			thefinalJSONArray.put(JSONtmp1.getJSONObject(args));
			debug = String.format("thefinalJSONArray = %s", thefinalJSONArray);
			logger.debug(debug);
			
		}
		else{
			thefinalJSONArray.put(JSONtmp1);
			debug = String.format("else thefinalJSONArray = %s", thefinalJSONArray);
			logger.debug(debug);
		}
       
	}

    public JSONObject getfinalJSON() throws JSONException {
        thefinalJSON.put("list", thefinalJSONArray);
        return thefinalJSON;
    }

    public Integer getCounter() {
        return counter;
    }
}
