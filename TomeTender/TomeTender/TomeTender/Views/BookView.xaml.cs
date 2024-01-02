using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace TomeTender.Views
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class BookView : ContentPage
    {
        public BookView()
        {
            InitializeComponent();
        }
        //Back Button
        //private async void OnBackClicked(object sender, EventArgs e)
        //{
        //    await Navigation.PopAsync();
        //}
        //Home Button
        private async void OnHomeClicked(object sender, EventArgs e)
        {
            await Navigation.PopToRootAsync();
        }
    }
}