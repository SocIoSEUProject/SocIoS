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
 * @author Thanos
 */
public class Utilities {
    
       
    public static void swap(int[][] arr, int arg1, int arg2) {
        int[] t = arr[arg1];
        arr[arg1] = arr[arg2];
        arr[arg2] = t;
    }
    
    
  
    public static void swap(int[] arr, int arg1, int arg2) {
        int t = arr[arg1];
        arr[arg1] = arr[arg2];
        arr[arg2] = t;
    }

    
}
