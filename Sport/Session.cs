using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace Sport
{
    public class Session
    {
        private static Session _instance;

        public User User { get; set; }

        private Session()
        {
        }


        public static Session Get()
        {
            if (_instance == null)
            {
                _instance = new Session();
            }
            return _instance;
        }

        public bool IsAdmin()
        {
            if (User == null)
            {
                return false;
            }
            return User.Role.RoleName == "Администратор";
        }

        public bool IsManager()
        {
            if (User == null)
            {
                return false;
            }
            return User.Role.RoleName == "Менеджер";
        }

        public bool IsClient()
        {
            if (User == null)
            {
                return false;
            }
            return User.Role.RoleName == "Клиент";
        }

        public void Clear()
        {
            User = null;
        }
    }
}
