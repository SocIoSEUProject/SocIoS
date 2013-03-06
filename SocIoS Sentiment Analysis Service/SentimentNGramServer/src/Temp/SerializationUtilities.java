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
 
 package Temp;

import java.io.*;

/**
 *
 * @author gap2
 */

public class SerializationUtilities {

    public static Object loadSerializedObject(String fileName) {
        Object object = null;
        try{
            InputStream file = new FileInputStream(fileName);
            InputStream buffer = new BufferedInputStream( file );
            ObjectInput input = new ObjectInputStream ( buffer );
            try{
                object = input.readObject();
            }
            finally{
                input.close();
            }
        }
        catch(ClassNotFoundException cnfEx){
            cnfEx.printStackTrace();
        }
        catch(IOException ioex){
            ioex.printStackTrace();
        }

        return object;
    }
    
    public static void storeSerializedObject(Object object, String outputPath) {
        try {
            OutputStream file = new FileOutputStream(outputPath);
            OutputStream buffer = new BufferedOutputStream(file);
            ObjectOutput output = new ObjectOutputStream(buffer);
            try {
                output.writeObject(object);
            } finally {
                output.close();
            }
        } catch (IOException ioex) {
            ioex.printStackTrace();
        }
    }
}