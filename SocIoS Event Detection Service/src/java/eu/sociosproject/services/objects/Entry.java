/*
*    This file is part of SocIoS Event Detection Service.
*
*    SocIoS Event Detection Service is free software: you can redistribute it and/or modify
*    it under the terms of the GNU General Public License as published by
*    the Free Software Foundation, either version 3 of the License, or
*    (at your option) any later version.
*
*    SocIoS Event Detection Service is distributed in the hope that it will be useful,
*    but WITHOUT ANY WARRANTY; without even the implied warranty of
*    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
*    GNU General Public License for more details.
*
*    You should have received a copy of the GNU General Public License
*    along with SocIoS Event Detection Service.  If not, see <http://www.gnu.org/licenses/>.
 *
 */
 
package eu.sociosproject.services.objects;

/**
 *
 * @author thanos
 */
public class Entry implements Comparable<Entry> {
    
    private Integer wordId;    
    private Integer counter;

    public Entry(Integer wordId, Integer counter) {
        this.wordId = wordId;
        this.counter = counter;
    }
       
    @Override
    public int compareTo(Entry other) {
        if(this.counter < other.counter)
            return 1;
        else 
            return -1;
       
    }

    public Integer getCounter() {
        return counter;
    }

    public Integer getWordId() {
        return wordId;
    }
    
    
}
