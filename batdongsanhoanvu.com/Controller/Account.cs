using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Model;
using System.Web;
using System.Web.UI;
using vpro.functions;

namespace Controller
{
    public class Account
    {
        #region Decclare
        dbVuonRauVietDataContext db = new dbVuonRauVietDataContext();
        #endregion
        public bool Login(string Email, string MatKhau)
        {
            var dangnhap = from a in db.ESHOP_CUSTOMERs
                           where a.CUSTOMER_EMAIL == Email && a.CUSTOMER_PW == MatKhau
                           select a;
            if (dangnhap.ToList().Count > 0)
            {
                Load_All_Cuss(Email);
                return true;
            }
            else
                return false;
        }

        private void Load_All_Cuss(string email)
        {
            try
            {
                var _cus = db.GetTable<ESHOP_CUSTOMER>().Where(a => a.CUSTOMER_EMAIL == email);
                if (_cus.ToList().Count > 0)
                {
                    HttpContext.Current.Session["User_Name"] = _cus.ToList()[0].CUSTOMER_FULLNAME;
                    HttpContext.Current.Session["User_ID"] = _cus.ToList()[0].CUSTOMER_ID;
                    HttpContext.Current.Session["User_Phone"] = _cus.ToList()[0].CUSTOMER_PHONE1;
                    HttpContext.Current.Session["User_Email"] = _cus.ToList()[0].CUSTOMER_EMAIL;
                }
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }
        public void Load_All_Cus(string email)
        {
            try
            {
                var _cus = db.GetTable<ESHOP_USER>().Where(a => a.USER_EMAIL == email);
                if (_cus.ToList().Count > 0)
                {
                    HttpContext.Current.Session["User_Address"] = _cus.ToList()[0].USER_ADDRESS;
                    HttpContext.Current.Session["User_Field1"] = _cus.ToList()[0].USER_FIELD1;
                    HttpContext.Current.Session["User_Field2"] = _cus.ToList()[0].USER_FIELD2;
                    HttpContext.Current.Session["User_Field3"] = _cus.ToList()[0].USER_FIELD3;
                    HttpContext.Current.Session["User_Field4"] = _cus.ToList()[0].USER_FIELD4;
                    HttpContext.Current.Session["User_Name"] = _cus.ToList()[0].USER_NAME;
                    HttpContext.Current.Session["User_ID"] = _cus.ToList()[0].USER_ID;
                    HttpContext.Current.Session["User_Phone"] = _cus.ToList()[0].USER_PHONE;
                    HttpContext.Current.Session["User_GroupID"] = _cus.ToList()[0].GROUP_ID;
                }
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }
        public bool CheckExitsEmail(string mail)
        {
            try
            {
                var _user = db.GetTable<ESHOP_CUSTOMER>().Where(u => u.CUSTOMER_EMAIL == mail.Trim());

                if (_user.ToList().Count > 0)
                    return true;

                return false;
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return true;
            }
        }
        // load custom
        public List<ESHOP_CUSTOMER> custom()
        {
            try
            {
                var _new = db.GetTable<ESHOP_CUSTOMER>().OrderByDescending(g => g.CUSTOMER_ID).Take(1).ToList();
                return _new;
            }
            catch (Exception)
            {
                throw;
            }
        }
        public List<ESHOP_CUSTOMER> LoadUser(int userid)
        {
            try
            {
                var _new = db.GetTable<ESHOP_CUSTOMER>().Where(a => a.CUSTOMER_ID == userid).OrderByDescending(g => g.CUSTOMER_ID).Take(1).ToList();
                return _new;
            }
            catch (Exception)
            {
                throw;
            }
        }
        //load custom quyen mat khau
        public List<ESHOP_CUSTOMER> custom_qmk(string email, string pass)
        {
            try
            {
                var _new = db.GetTable<ESHOP_CUSTOMER>().Where(a => a.CUSTOMER_EMAIL == email).OrderByDescending(g => g.CUSTOMER_ID).Take(1).ToList();
                {
                    _new[0].CUSTOMER_PW = pass;
                    db.SubmitChanges();
                }
                return _new;
            }
            catch (Exception)
            {
                throw;
            }
        }
        public string LayHoTen(string Email)
        {
            var dangnhap = from a in db.ESHOP_CUSTOMERs
                           where a.CUSTOMER_EMAIL == Email
                           select a;
            return dangnhap.ToList().Count > 0 ? dangnhap.ToList()[0].CUSTOMER_FULLNAME : "";
        }
        public void insertCus(string email, string pass, string name, string phone, DateTime birthday)
        {
            try
            {
                ESHOP_CUSTOMER user = new ESHOP_CUSTOMER();
                user.CUSTOMER_EMAIL = email;

                user.CUSTOMER_PW = pass;
                user.CUSTOMER_FULLNAME = name.ToLower();
                user.CUSTOMER_PHONE1 = phone;

                user.CUSTOMER_PUBLISHDATE = birthday;
                user.CUSTOMER_UPDATE = DateTime.Now;
                user.CUSTOMER_SHOWTYPE = 0;
                db.ESHOP_CUSTOMERs.InsertOnSubmit(user);

                db.SubmitChanges();
                HttpContext.Current.Session["Login_Email"] = name;
            }
            catch (Exception)
            {
                throw;
            }

        }

        public object txtPassword1 { get; set; }
    }
}
