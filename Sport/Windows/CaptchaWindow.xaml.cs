﻿using EasyCaptcha.Wpf;
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
    /// Логика взаимодействия для CaptchaWindow.xaml
    /// </summary>
    public partial class CaptchaWindow : Window
    {
        public CaptchaWindow()
        {
            InitializeComponent();

            captcha.CreateCaptcha(Captcha.LetterOption.Alphanumeric, 5);
        }

        private void submit_Click(object sender, RoutedEventArgs e)
        {
            var txt = captcha.CaptchaText;
            if (answer.Text == txt)
            {
                DialogResult = true;
                Close();
                return;
            }
            DialogResult = false;

        }
    }
}
