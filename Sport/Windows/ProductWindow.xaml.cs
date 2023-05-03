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
            costPerUnit.Text = product.ProductCost.ToString();
            description.Text = product.ProductDescription;
        }

        private void DisableInputs()
        {
            articleNumber.IsEnabled = false;
            name.IsEnabled = false;
            category.IsEnabled = false;
            quantityInStock.IsEnabled = false;
            countInBox.IsEnabled = false;
            minCount.IsEnabled = false;
            manufacturer.IsEnabled = false;
            maxDiscount.IsEnabled = false;
            currentDiscount.IsEnabled = false;
            costPerUnit.IsEnabled = false;
            description.IsEnabled = false;
            unit.IsEnabled = false;
        }
    }
}
