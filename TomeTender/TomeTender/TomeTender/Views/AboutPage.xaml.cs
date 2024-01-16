using System;
using System.ComponentModel;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace TomeTender.Views
{
    public partial class AboutPage : ContentPage
    {
        public AboutPage()
        {
            InitializeComponent();
        }

        async void GoToBookAvailability(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new Home());
        }
    }
}