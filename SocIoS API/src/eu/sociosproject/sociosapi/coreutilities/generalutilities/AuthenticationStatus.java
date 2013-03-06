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
public class AuthenticationStatus {
    
    private boolean automatic;
    private boolean validKey;
    private SocialNetwork sns;
    
    public AuthenticationStatus() {
        validKey = false;
        sns = null;
    }

    public SocialNetwork getSns() {
        return sns;
    }
    
    public boolean isAutomatic() {
        return automatic;
    }
    
    public boolean isValidKey() {
        return validKey;
    }

    public void setAutomatic(boolean automatic) {
        this.automatic = automatic;
    }
    
    public void setSns(SocialNetwork sns) {
        this.sns = sns;
    }
    
    public void setValidKey(boolean validKey) {
        this.validKey = validKey;
    }
}