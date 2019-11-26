package hu.oe.hoe.adatok;

public class Stock {
    private NaturalAsset asset;
    private long quantity;
    
    public Stock(NaturalAsset asset, long quantity){
        this.asset = asset;
        this.quantity = quantity;
    }
    
    public Stock(){
    }

    public NaturalAsset getAsset() {
        return asset;
    }

    public void setAsset(NaturalAsset asset) {
        this.asset = asset;
    }

    public long getQuantity() {
        return quantity;
    }

    public void setQuantity(long quantity) {
        this.quantity = quantity;
    }
}
