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
        private Session _session = Session.Get();
        private DateTime _nbf = DateTime.Now;

        public AuthorizationWindow()
        {
            InitializeComponent();
            _db = new TradeEntities();
        }

        private void continueAsGuest_Click(object sender, RoutedEventArgs e)
        {
            var productsListWindow = new ProductsListWindow();
            productsListWindow.Show();
            Hide();
        }

        private void signIn_Click(object sender, RoutedEventArgs e)
        {
            if (DateTime.Now < _nbf)
            {
                MessageBox.Show("Попробуйте позже");
                return;
            }
            var user = _db.User.Where(x => x.UserLogin == login.Text && x.UserPassword == password.Password).FirstOrDefault();
            if (user == null)
            {
                MessageBox.Show("Пользователь не найден");
                var window = new CaptchaWindow();
                var result = window.ShowDialog();
                if (result == true) // correct captcha 
                {
                    _nbf = DateTime.Now;
                } else
                {
                    _nbf = DateTime.Now.AddSeconds(10);
                }
                return;
            }
            _session.User = user;
            
            if (_session.IsManager() || _session.IsAdmin())
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
