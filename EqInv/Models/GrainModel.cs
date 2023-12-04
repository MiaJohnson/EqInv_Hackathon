using SQLite;
using System.ComponentModel;

namespace EqInv.Models
{
  [Table("grain")]
  public class GrainModel
  {

    [PrimaryKey, AutoIncrement]
    public int GrainId { get; set; }

    [MaxLength(250)]
    public string Manufacturer { get; set; }

    [MaxLength(250)]
    [DisplayName("Product Name")]
    public string? ProductName { get; set; }

    public int? Quantity { get; set; }

    [DisplayName("Price Per Item")]
    public decimal? PricePerItem { get; set; }

    [DisplayName("Tax Amount")]
    public decimal? TaxAmount { get; set; }

    [DisplayName("Weight Per Item")]
    public decimal? WeightPerItem { get; set; }

    public string Note { get; set; } = string.Empty;

    [DisplayName("Purchase Date")]
    public DateTime? PurchaseDate { get; set; }


    [DisplayName("Delivery Cost")]
    public decimal? DeliveryCost { get; set; }


    [Ignore]
    [DisplayName("Total Weight")]
    public decimal? TotalWeight
    {
      get
      {
        var weight = WeightPerItem is not null ? (decimal)WeightPerItem : 0;
        int qty = Quantity is not null ? (int)Quantity : 0;
        return weight * qty;
      }
    }

    [Ignore]
    [DisplayName("Total Price")]
    public decimal TotalPrice
    {
      get
      {
        int qty = Quantity is not null ? (int)Quantity : 0;
        var price = PricePerItem is not null ? (decimal)PricePerItem : 0;
        var tax = TaxAmount is not null ? (decimal)TaxAmount : 0;
        var deliveryCost = DeliveryCost is not null ? (decimal)DeliveryCost : 0;
        //var calculatedTax = ((price * qty) + DeliveryCost) * 1.06;
        return (qty * price) + tax + deliveryCost;
      }
    }

    [Ignore]
    [DisplayName("Total Minus Tax")]
    public decimal CalculatedTotalMinusTax
    {
      get
      {
        decimal qty = Quantity is not null ? (decimal)Quantity : 0;
        decimal price = PricePerItem is not null ? (decimal)PricePerItem : 0;
        decimal deliveryCost = DeliveryCost is not null ? (decimal)DeliveryCost : 0;
        //decimal taxRate = StateTaxRate; // 1.06m;
        decimal total = price * qty + deliveryCost;
        return total;
      }
    }

    [Ignore]
    [DisplayName("Total Price")]
    public string TotalPriceFormatted
    {
      get
      {
        return $"{TotalPrice:C2}";
      }
    }


    [Ignore]
    [DisplayName("Quantity")]
    public string QuantityFormatted
    {
      get
      {
        int qty = Quantity is not null ? (int)Quantity : 0;
        return $"{qty:N2}";
      }
    }

    [Ignore]
    [DisplayName("Grain")]
    public string ManufacturerPlusProductName
    {
      get
      {
        var newName = $"{Manufacturer.Trim()} {ProductName.Trim()}";

        return newName;
      }
    }


  }
}
