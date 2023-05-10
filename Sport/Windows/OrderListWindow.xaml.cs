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
    /// Логика взаимодействия для OrderListWindow.xaml
    /// </summary>
    public partial class OrderListWindow : Window
    {
        private readonly Window _prevWindow;
        private readonly TradeEntities _db = new TradeEntities();
        private ObservableCollection<Order> _orders;

        public OrderListWindow(Window prevWindow)
        {
            _prevWindow = prevWindow;
            InitializeComponent();
            _orders = new ObservableCollection<Order>(_db.Order.ToList());

            ordersList.ItemsSource = _orders;
        }

        private void back_Click(object sender, RoutedEventArgs e)
        {
            _prevWindow.Show();
            Hide();
        }

        private void open_Click(object sender, RoutedEventArgs e)
        {
            var order = ordersList.SelectedItem as Order;
            if (order == null)
            {
                return;
            }


            var window = new OrderWindow(order.OrderID);
            var result = window.ShowDialog();
            if (result == true)
            {
                ordersList.ItemsSource = null;
                _orders = new ObservableCollection<Order>(_db.Order.ToList());

                ordersList.ItemsSource = _orders;
            }

        }
    }
}
