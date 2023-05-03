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
        private readonly TradeEntities _db = new TradeEntities();
        private Session _session = Session.Get();

        public ProductWindow()
        {
            InitializeComponent();
        }

        public ProductWindow(string productSKU)
        {
            var product = _db.Product.Where(x => x.ProductArticleNumber == productSKU).FirstOrDefault();
            if (product == null)
            {
                MessageBox.Show("Продукт не найден!");
                DialogResult = false;
                Close();
            }
            InitializeComponent();
            _product = product;

            fillValuesFromProduct(product);
            if (!Session.Get().IsAdmin())
            {
                DisableInputs();
                RemoveInputBorders();
            }
            ShowContextButtons();
        }

        private void ShowContextButtons()
        {
            if (_session.IsAdmin())
            {
                if (_product != null) // меняем продукт
                {
                    save.Visibility = Visibility.Hidden;
                    change.Visibility = Visibility.Visible;
                    delete.Visibility = Visibility.Visible;
                }
                else
                {
                    // создаем продукт
                    save.Visibility = Visibility.Visible;
                    change.Visibility = Visibility.Hidden;
                    delete.Visibility = Visibility.Hidden;
                }
            }
            else
            {
                save.Visibility = Visibility.Hidden;
                change.Visibility = Visibility.Hidden;
                delete.Visibility = Visibility.Hidden;
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

        private void change_Click(object sender, RoutedEventArgs e)
        {
            _product.ProductArticleNumber = articleNumber.Text;
            _product.ProductName = name.Text;
            _product.ProductDescription = description.Text;
            _product.ProductCategory = category.Text;
            _product.ProductManufacturer = manufacturer.Text;
            _product.ProductCost = decimal.Parse(costPerUnit.Text);
            _product.ProductQuantityInStock = int.Parse(quantityInStock.Text);
            _product.ProductDiscountAmount = byte.Parse(currentDiscount.Text);
            _product.ProductStatus = "";

            try
            {
                _db.Entry(_product).State = System.Data.Entity.EntityState.Modified;
                _db.SaveChanges();
                DialogResult = true;
            }
            catch
            {
                foreach (var error in _db.GetValidationErrors())
                {
                    foreach (var message in error.ValidationErrors)
                    {
                        MessageBox.Show(message.ErrorMessage);
                    }
                }
                return;
            }
        }

        private void save_Click(object sender, RoutedEventArgs e)
        {
            var product = new Product()
            {
                ProductArticleNumber = articleNumber.Text,
                ProductName = name.Text,
                ProductDescription = description.Text,
                ProductCategory = category.Text,
                ProductPhoto = new byte[] { },
                ProductManufacturer = manufacturer.Text,
                ProductCost = decimal.Parse(costPerUnit.Text),
                ProductQuantityInStock = int.Parse(quantityInStock.Text),
                ProductStatus = ""
            };
            try
            {
                _db.Product.Add(product);
                _db.SaveChanges();
                DialogResult = true;
            }
            catch
            {
                foreach (var error in _db.GetValidationErrors())
                {
                    foreach (var message in error.ValidationErrors)
                    {
                        MessageBox.Show(message.ErrorMessage);
                    }
                }
                return;
            }
        }

        private void delete_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                _db.Product.Remove(_product);
                _db.SaveChanges();
                DialogResult = true;
            }
            catch
            {
                foreach (var error in _db.GetValidationErrors())
                {
                    foreach (var message in error.ValidationErrors)
                    {
                        MessageBox.Show(message.ErrorMessage);
                    }
                }

            }
        }
    }
}
