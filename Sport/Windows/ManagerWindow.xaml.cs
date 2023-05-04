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
    /// Логика взаимодействия для ManagerWindow.xaml
    /// </summary>
    public partial class ManagerWindow : Window
    {
        public ManagerWindow()
        {
            InitializeComponent();
        }

        private void showProducts_Click(object sender, RoutedEventArgs e)
        {
            var window = new ProductsListWindow(this);
            window.Show();
            Hide();
        }

        private void showOrders_Click(object sender, RoutedEventArgs e)
        {
            var window = new OrderListWindow(this);
            window.Show();
            Hide();

        }
    }
}
