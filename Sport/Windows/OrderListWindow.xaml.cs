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
    /// Логика взаимодействия для OrderListWindow.xaml
    /// </summary>
    public partial class OrderListWindow : Window
    {
        private readonly Window _prevWindow;
        private readonly TradeEntities _db = new TradeEntities();
        public OrderListWindow(Window prevWindow)
        {
            _prevWindow = prevWindow;
            InitializeComponent();

            ordersList.ItemsSource = _db.Order.ToList();
        }

        private void back_Click(object sender, RoutedEventArgs e)
        {
            _prevWindow.Show();
            Hide();
        }

        private void open_Click(object sender, RoutedEventArgs e)
        {
            var order = ordersList.SelectedItem;
            if (order == null)
            {
                return;
            }

        }
    }
}
