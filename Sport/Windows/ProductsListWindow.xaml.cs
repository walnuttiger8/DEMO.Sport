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
    /// Логика взаимодействия для ProductsListWindow.xaml
    /// </summary>
    public partial class ProductsListWindow : Window
    {
        private readonly TradeEntities _db;
        private Order _order = new Order();
        private readonly int _totalProductsCount;
        private readonly Window _prevWindow;

        public ProductsListWindow(Window prevWindow = null)
        {
            if (prevWindow == null)
            {
                _prevWindow = new AuthorizationWindow();
            } else
            {
                _prevWindow = prevWindow;
            }
            _db = new TradeEntities();
            InitializeComponent();

            _totalProductsCount = _db.Product.Count();
            totalAmount.Text = _totalProductsCount.ToString();

            LoadProducts();

            if (Session.Get().IsAdmin())
            {
                addProduct.Visibility = Visibility.Visible;
            } else
            {
                addProduct.Visibility = Visibility.Hidden;
            }
            showOrder.Visibility = Visibility.Hidden;
         }

        private void LoadProducts()
        {
            if (priceFilter == null)
            {
                return;
            }
            var products = _db.Product.AsQueryable();
            if (searchText.Text.Length > 0)
            {
                products = products.Where(x => x.ProductName.Contains(searchText.Text));
            }
            switch (discountFilter.SelectedIndex)
            {
                case 1: // 0 - 9,99%
                    products = products.Where(x => x.ProductDiscountAmount >= 0 && x.ProductDiscountAmount <= 9.99);
                    break;
                case 2: // 10 - 14.99%
                    products = products.Where(x => x.ProductDiscountAmount >= 10 && x.ProductDiscountAmount <= 14.99);
                    break;
                case 3: // >15%
                    products = products.Where(x => x.ProductDiscountAmount >= 15);
                    break;

            }
            if (priceFilter.SelectedIndex == 0) // по возрастанию
            {
                products = products.OrderBy(x => x.ProductCost);
            }
            if (priceFilter.SelectedIndex == 1) // по убыванию
            {
                products = products.OrderByDescending(x => x.ProductCost);
            }


            productsListView.ItemsSource = products.ToList();
            currentAmount.Text = products.Count().ToString();
        }

        private void Window_Closed(object sender, EventArgs e)
        {
            _db.Dispose();
        }

        private void watchButton_Click(object sender, RoutedEventArgs e)
        {
            var selectedProduct = productsListView.SelectedItem as Product;
            if (selectedProduct != null)
            {
                var window = new ProductWindow(selectedProduct.ProductArticleNumber);
                var result = window.ShowDialog();
                if (result == true)
                {
                    LoadProducts();
                }
            }
        }

        private void addToOrderButton_Click(object sender, RoutedEventArgs e)
        {
            var productToAdd = productsListView.SelectedItem as Product;
            if (productToAdd != null)
            {
                _order.Product.Add(productToAdd);
                showOrder.Visibility = Visibility.Visible;
            }
        }

        private void showOrder_Click(object sender, RoutedEventArgs e)
        {
            var window = new OrderWindow(_order);
            var result = window.ShowDialog();
            if (result == true) // order created
            {
                _order = new Order(); // create new order
                showOrder.Visibility = Visibility.Hidden;
            }
        }

        private void searchText_TextChanged(object sender, TextChangedEventArgs e)
        {
            LoadProducts();
        }

        private void priceFilter_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            LoadProducts();
        }

        private void discountFilter_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            LoadProducts();
        }

        private void back_Click(object sender, RoutedEventArgs e)
        {
            if (_order != null && _order.Product != null && _order.Product.Any())
            {
                var result = MessageBox.Show("Ваш заказ не будет сохранен, продолжить?", "Подтверждение", MessageBoxButton.YesNo);
                if (result == MessageBoxResult.Yes)
                {
                    Session.Get().Clear();
                    _prevWindow.Show();
                    Close();
                }
            } else
            {
                Session.Get().Clear();
                _prevWindow.Show();
                Close();
            }
            
        }

        private void addProduct_Click(object sender, RoutedEventArgs e)
        {
            var window = new ProductWindow();
            var result = window.ShowDialog();
            if (result == true)
            {
                LoadProducts();
            }

        }
    }
}
