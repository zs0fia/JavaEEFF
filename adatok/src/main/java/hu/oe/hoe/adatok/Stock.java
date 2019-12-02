package hu.oe.hoe.adatok;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="stock")
public class Stock {
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Id
    private long id;
    @OneToOne
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
