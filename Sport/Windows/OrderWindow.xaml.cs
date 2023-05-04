using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
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

        public OrderWindow(Order order)
        {
            InitializeComponent();
            _order = order;
            _products = new ObservableCollection<Product>(_order.Product);

            productsListView.ItemsSource = _products;
            DisplayTotalCost();
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

            productsListView.ItemsSource = _order.Product;
        }

        private void deleteProduct_Click(object sender, RoutedEventArgs e)
        {
            var button = sender as Button;
            var product = button.DataContext as Product;
            
            _products.Remove(product);
            DisplayTotalCost();
        }

        private void DisplayTotalCost()
        {
            totalCost.Text = Math.Round(CalculateTotalCost(), 2).ToString();
        }

        private decimal CalculateTotalCost()
        {
            var result = _products.Select(x => x.ProductCost).Sum();
            return result;
        }

        private void createOrder_Click(object sender, RoutedEventArgs e)
        {
            _order.Product = _products;
            _order.OrderStatus = "Новый";
            _order.OrderPickupPoint = pickUpPoint.Text;

            try
            {
                _db.Order.Add(_order);
                _db.SaveChanges();
                DialogResult = true;
            } catch
            {
                foreach (var i in _db.GetValidationErrors())
                {
                    foreach(var m in i.ValidationErrors)
                    {
                        MessageBox.Show(m.ErrorMessage);
                    }
                }
                return;
            }

        }
    }
}
