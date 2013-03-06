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
public class AdaptorSettings {
 
    private int adaptorType;
    private String url;
    
    public AdaptorSettings() {
        adaptorType = -1;
        url = null;
    }

    public int getAdaptorType() {
        return adaptorType;
    }
    
    public String getUrl() {
        return url;
    }

    public void setAdaptorType(int adaptorType) {
        this.adaptorType = adaptorType;
    }
    
    public void setUrl(String url) {
        this.url = url;
    }
}