using Microsoft.Win32;
using Sport.Utils;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Diagnostics;
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
    /// Логика взаимодействия для OrderWindow.xaml
    /// </summary>
    public partial class OrderWindow : Window
    {
        private Order _order;
        private ObservableCollection<Product> _products;
        private readonly TradeEntities _db = new TradeEntities();
        private Dictionary<string, int> _productsCount;
        private Session _session = Session.Get();

        public OrderWindow(List<Product> products)
        {
            InitializeComponent();
            _products = new ObservableCollection<Product>(products);

            productsListView.ItemsSource = _products;
            InitProductsCount();
            DisplayTotalCost();
            DisplayTotalDiscount();
            InitializePickUpPoints();
        }

        public OrderWindow(int orderId)
        {
            _order = _db.Order.Where(x => x.OrderID == orderId).FirstOrDefault();
            if (_order == null)
            {
                MessageBox.Show("Заказ не найден");
                Close();
            }
            InitializeComponent();
            status.IsEnabled = true;

            _products = new ObservableCollection<Product>(_order.Product);
            productsListView.ItemsSource = _products;

            status.SelectedItem = _order.OrderStatus;

            InitProductsCount();
            DisplayTotalCost();
            DisplayTotalDiscount();
            InitializePickUpPoints();
        }

        private void InitProductsCount()
        {
            _productsCount = new Dictionary<string, int>();
            foreach (Product product in _products)
            {
                _productsCount.Add(product.ProductArticleNumber, 1);
            }
        }

        private void deleteProduct_Click(object sender, RoutedEventArgs e)
        {
            var button = sender as Button;
            var product = button.DataContext as Product;
            
            _products.Remove(product);
            DisplayTotalCost();
            DisplayTotalDiscount();
        }

        private void DisplayTotalCost()
        {
            totalCost.Text = Math.Round(CalculateTotalCost(), 2).ToString();
        }

        private decimal CalculateTotalCost()
        {
            var result = _products.Select(x => x.ProductCost * _productsCount[x.ProductArticleNumber]).Sum();
            return result;
        }

        private void DisplayTotalDiscount()
        {
            totalDiscount.Text = Math.Round(CalculateTotalDiscount(), 2).ToString();
        }

        private double CalculateTotalDiscount()
        {
            var result = _products.Select(x => CalculateDiscountForProduct(x) * _productsCount[x.ProductArticleNumber]).Sum();
            return result;
        }

        private double CalculateDiscountForProduct(Product product)  // скидка в рублях
        {
            if (product.ProductDiscountAmount == 0 || product.ProductDiscountAmount == null)
            {
                return 0;
            }
            double discount = (double) product.ProductDiscountAmount / 100d;
            double cost = (double) product.ProductCost;

            return cost * discount;

        }

        private void count_TextChanged(object sender, TextChangedEventArgs e)
        {
            var product = productsListView.SelectedItem as Product;
            if (product == null)
            {
                return;
            }

            try
            {
                var value = int.Parse(count.Text);
                if (value == 0)
                {
                    var result = MessageBox.Show($"Вы хотите удалить удалить {product.ProductName} из заказа?", "удалить?", MessageBoxButton.YesNo);
                    if (result == MessageBoxResult.Yes)
                    {
                        _products.Remove(product);
                        _productsCount.Remove(product.ProductArticleNumber);
                        productsListView.SelectedItem = null;
                        DisplayTotalCost();
                        DisplayTotalDiscount();
                        return;
                    } else
                    {
                        count.Text = _productsCount[product.ProductArticleNumber].ToString();  // return previous value
                        return;
                    }
                }
                _productsCount[product.ProductArticleNumber] = value;
                DisplayTotalCost();
                DisplayTotalDiscount();
            } catch
            {
                count.Text = "";
                return;
            }
            
        }

        private void productsListView_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            var product = productsListView.SelectedItem as Product;
            if (product == null)
            {
                return;
            }
            count.Text = _productsCount[product.ProductArticleNumber].ToString();
            SwitchProductContextControls(true);
        }

        private void SwitchProductContextControls(bool enable = true)
        {
            count.IsEnabled = enable;
            delete.IsEnabled = enable;
        }

        private void delete_Click(object sender, RoutedEventArgs e)
        {
            var product = productsListView.SelectedItem as Product;
            if (product == null)
            {
                return;
            }
            var result = MessageBox.Show($"Вы хотите удалить удалить {product.ProductName} из заказа?", "удалить?", MessageBoxButton.YesNo);
            if (result == MessageBoxResult.Yes)
            {
                _products.Remove(product);
                _productsCount.Remove(product.ProductArticleNumber);
                productsListView.SelectedItem = null;
                DisplayTotalCost();
                return;
            }
        }

        private void InitializePickUpPoints()
        {
            var pp = _db.PickUpPoint.ToList();
            pickUpPoint.ItemsSource = pp;

            if (_order != null)
            {
                foreach (var p in pp)
                {
                    if (p.RawAddress == _order.OrderPickupPoint)
                    {
                        pickUpPoint.SelectedItem = p;
                        return;
                    }
                }
            }
        }

        private void save_Click(object sender, RoutedEventArgs e)
        {
            
            if (_order == null)
            {
                CreateOrder();
            } else if (_order != null && (_session.IsAdmin() || _session.IsManager())) {
                EditOrder();
            }
        }

        private void EditOrder()
        {
            var pp = pickUpPoint.SelectedItem as PickUpPoint;
            if (pp == null)
            {
                MessageBox.Show("Необходимо выбрать пункт выдачи");
                return;
            }

            _order.Product.Clear();

            foreach (var product in _products)
            {
                var p = _db.Product.Where(x => x.ProductArticleNumber == product.ProductArticleNumber).FirstOrDefault();
                if (p != null)
                {
                    _order.Product.Add(p);
                }
            }

            _order.OrderPickupPoint = pp.RawAddress;
            _order.OrderStatus = status.SelectedItem as string;

            try
            {
                _db.SaveChanges();
                DialogResult = true;
            }
            catch (Exception ex)
            {
                foreach (var i in _db.GetValidationErrors())
                {
                    foreach (var m in i.ValidationErrors)
                    {
                        MessageBox.Show(m.ErrorMessage);
                    }
                }
                DialogResult = false;
                return;
            }

        }

        private void CreateOrder()
        {
            var pp = pickUpPoint.SelectedItem as PickUpPoint;
            if (pp == null)
            {
                MessageBox.Show("Необходимо выбрать пункт выдачи");
                return;
            }

            if (_order == null)
            {
                _order = new Order();
            }


            foreach (var product in _products)
            {
                var p = _db.Product.Where(x => x.ProductArticleNumber == product.ProductArticleNumber).FirstOrDefault();
                if (p != null)
                {
                    _order.Product.Add(p);
                }
            }
            _order.OrderStatus = status.SelectedItem.ToString();
            _order.OrderPickupPoint = pp.RawAddress;
            _order.OrderDeliveryDate = DateTime.Now;

            try
            {
                _db.Order.Add(_order);
                _db.SaveChanges();
                DrawOrderInfoPDF();
                DialogResult = true;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString()); ;
                foreach (var i in _db.GetValidationErrors())
                {
                    foreach (var m in i.ValidationErrors)
                    {
                        MessageBox.Show(m.ErrorMessage);
                    }
                }
                return;
            }
        }

        private void DrawOrderInfoPDF()
        {
            if (_order == null)
            {
                return;
            }
            var title = $"Заказ #{_order.OrderID}";
            string subTitle;
            if (_session.User != null)
            {
                subTitle = $"Получатель: {_session.User.UserName} {_session.User.UserPatronymic}";
            }
            else {
                subTitle = "Получатель: не указан";
            }

            var orderComposition = "";
            foreach (var product in _order.Product)
            {
                orderComposition += $"{product.ProductName} ({product.ProductArticleNumber}) - {_productsCount[product.ProductArticleNumber]} шт.\n";
            }


            var description = $"Дата заказа: {DateTime.Now};\n" +
                $"Пункт выдачи: {_order.OrderPickupPoint};\n" +
                $"Сумма заказа: {Math.Round(CalculateTotalCost(), 2)} р.;\n" +
                $"Скидка: {Math.Round(CalculateTotalDiscount(), 2)} р.;\n" +
                $"Состав заказа:\n {orderComposition}";
            

            var pdfDoc = new PDFDoc();
            var doc = pdfDoc.Render(title, subTitle, description);

            var fd = new SaveFileDialog();
            fd.DefaultExt = ".pdf";
            fd.Filter = "PDF Files (*.pdf)|*.pdf";


            var dialogResult = fd.ShowDialog();

            if (dialogResult == true)
            {
                var filename = fd.FileName;
                doc.Save(filename);

                Process.Start(filename);
            }
        }
    }
}
