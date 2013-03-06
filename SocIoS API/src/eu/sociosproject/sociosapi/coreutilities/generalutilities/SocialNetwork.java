/*
 * Copyright 2013 National Technical University of Athens
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
 
package eu.sociosproject.sociosapi.coreutilities.generalutilities;

/**
 *
 * @author gap2
 */
public class SocialNetwork {
    
    private int snsId;
    private String snsName;
    private String url;

    public SocialNetwork() {
        snsId = -1;
        snsName = null;
        url = null;
    }
    
    public int getSnsId() {
        return snsId;
    }

    public String getSnsName() {
        return snsName;
    }

    public String getUrl() {
        return url;
    }

    public void setSnsId(int snsId) {
        this.snsId = snsId;
    }
    
    public void setSnsName(String snsName) {
        this.snsName = snsName;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}
