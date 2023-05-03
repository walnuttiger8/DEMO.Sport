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
    /// Логика взаимодействия для AuthorizationWindow.xaml
    /// </summary>
    public partial class AuthorizationWindow : Window
    {
        private readonly TradeEntities _db;
        public AuthorizationWindow()
        {
            InitializeComponent();
            _db = new TradeEntities();
            Session.Clear();
        }

        private void continueAsGuest_Click(object sender, RoutedEventArgs e)
        {
            var productsListWindow = new ProductsListWindow();
            productsListWindow.Show();
            Hide();
        }

        private void signIn_Click(object sender, RoutedEventArgs e)
        {
            var user = _db.User.Where(x => x.UserLogin == login.Text && x.UserPassword == password.Password).FirstOrDefault();
            if (user == null)
            {
                MessageBox.Show("Пользователь не найден");
                return;
            }
            Session.User = user;
            
            if (Session.IsManager() || Session.IsAdmin())
            {
                var window = new ManagerWindow();
                window.Show();
                Hide();
            } else
            {
                var window = new ProductsListWindow();
                window.Show();
                Hide();
            }

        }
    }
}
