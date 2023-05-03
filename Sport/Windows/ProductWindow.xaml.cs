using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace Sport.Windows
{
    /// <summary>
    /// Логика взаимодействия для ProductWindow.xaml
    /// </summary>
    public partial class ProductWindow : Window
    {
        private Product _product;

        public ProductWindow()
        {
            InitializeComponent();
        }

        public ProductWindow(Product product)
        {
            InitializeComponent();
            _product = product;

            fillValuesFromProduct(product);
            if (!Session.IsAdmin())
            {
                DisableInputs();
                RemoveInputBorders();
            }   
        }

        private void fillValuesFromProduct(Product product)
        {
            articleNumber.Text = product.ProductArticleNumber;
            name.Text = product.ProductName;
            category.Text = product.ProductCategory;
            quantityInStock.Text = product.ProductQuantityInStock.ToString();
            countInBox.Text = "1";
            minCount.Text = "1";
            manufacturer.Text = product.ProductManufacturer;
            maxDiscount.Text = "15";
            currentDiscount.Text = product.ProductDiscountAmount.ToString();
            costPerUnit.Text = Math.Round(product.ProductCost, 2).ToString();
            description.Text = product.ProductDescription;
        }

        private void DisableInputs()
        {
            articleNumber.IsReadOnly = true;
            name.IsReadOnly = true;
            category.IsReadOnly = true;
            quantityInStock.IsReadOnly = true;
            countInBox.IsReadOnly = true;
            minCount.IsReadOnly = true;
            manufacturer.IsReadOnly = true;
            maxDiscount.IsReadOnly = true;
            currentDiscount.IsReadOnly = true;
            costPerUnit.IsReadOnly = true;
            description.IsReadOnly = true;
            unit.IsReadOnly = true;
        }

        private void RemoveInputBorders()
        {
            articleNumber.BorderThickness = new Thickness(0);
            name.BorderThickness = new Thickness(0);
            category.BorderThickness = new Thickness(0);
            quantityInStock.BorderThickness = new Thickness(0);
            countInBox.BorderThickness = new Thickness(0);
            minCount.BorderThickness = new Thickness(0);
            manufacturer.BorderThickness = new Thickness(0);
            maxDiscount.BorderThickness = new Thickness(0);
            currentDiscount.BorderThickness = new Thickness(0);
            costPerUnit.BorderThickness = new Thickness(0);
            description.BorderThickness = new Thickness(0);
            unit.BorderThickness = new Thickness(0);
        }
    }
}
