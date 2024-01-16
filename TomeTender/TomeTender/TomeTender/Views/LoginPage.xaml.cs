using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TomeTender.ViewModels;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace TomeTender.Views
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class LoginPage : ContentPage
    {
        public LoginPage()
        {
            InitializeComponent();
            //this.BindingContext = new LoginViewModel();
        }
        private async void Button_Clicked(object sender, EventArgs e)
        {
            try
            {

                if (txtUsername.Text == "admin" && txtPassword.Text == "123")
                {
                    await Shell.Current.GoToAsync($"//{nameof(Home)}");
                }
                else
                {
                    await DisplayAlert("Oops..", "Username or Password is incorrect!", "OK");
                }
            }
            catch (ArgumentException ex)
            {
                Debug.WriteLine($"Processing Failed {ex.Message}");
                throw;
            }
        }
        private void TapGestureRecognizer_Tapped(object sender, EventArgs e)
        {
            Navigation.PushAsync(new Register());
        }

    }
}