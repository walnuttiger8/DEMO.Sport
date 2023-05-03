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

        public OrderWindow(Order order)
        {
            InitializeComponent();
            _order = order;
            _products = new ObservableCollection<Product>(_order.Product);

            productsListView.ItemsSource = _products;
        }

        private void deleteProduct_Click(object sender, RoutedEventArgs e)
        {
            var button = sender as Button;
            var product = button.DataContext as Product;
            
            _products.Remove(product);
        }
    }
}
