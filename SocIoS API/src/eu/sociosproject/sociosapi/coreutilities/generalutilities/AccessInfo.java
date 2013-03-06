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

import java.util.Date;

/**
 *
 * @author gap2
 */
public class AccessInfo {
    
    private boolean automatic;
    private int snsId;
    private int userId;
    private Date lastUpdate;
    private Date expirationDate;
    private String accessToken;
    private String refreshToken;
    private String username;
    
    public AccessInfo() {
        automatic = false;
        snsId = -1;
        userId = -1;
        lastUpdate = null;
        expirationDate = null;
        accessToken = null;
        refreshToken = null;
        username = null;
    }

    public String getAccessToken() {
        return accessToken;
    }
    
    public Date getExpirationDate() {
        return expirationDate;
    }

    public Date getLastUpdate() {
        return lastUpdate;
    }
    
    public String getRefreshToken() {
        return refreshToken;
    }
    
    public int getSnsId() {
        return snsId;
    }

    public int getUserId() {
        return userId;
    }
    
    public String getUsername() {
        return username;
    }

    public boolean isAutomatic() {
        return automatic;
    }

    public void setAccessToken(String accessToken) {
        this.accessToken = accessToken;
    }
    
    public void setAutomatic(boolean automatic) {
        this.automatic = automatic;
    }

    public void setExpirationDate(Date expirationDate) {
        this.expirationDate = expirationDate;
    }
    
    public void setLastUpdate(Date lastUpdate) {
        this.lastUpdate = lastUpdate;
    }
    
    public void setRefreshToken(String refreshToken) {
        this.refreshToken = refreshToken;
    }
    
    public void setSnsId(int snsId) {
        this.snsId = snsId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}
