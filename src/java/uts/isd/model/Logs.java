package uts.isd.model;

import java.io.Serializable;

/**
 *
 * @author Dev
 */
public class Logs implements Serializable{
    private int userID;
    private String status, currenttime;
    
    public Logs(
            int userID,
            int productSerialNum,
            String productName,
            String productCategory,
            String productBrand,
            float productPrice,
            int productQuantity,
            String productImageURL,
            int supplierID){
        this.userID = userID;
        this.status = status;
        this.currenttime = currenttime;
    }

    public int getUserID() {
        return userID;
    }

    public String getStatus() {
        return status;
    }

    public String getCurrenttime() {
        return currenttime;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setCurrenttime(String currenttime) {
        this.currenttime = currenttime;
    }
    

}

