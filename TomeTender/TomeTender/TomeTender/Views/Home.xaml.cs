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
    public partial class Home : ContentPage
    {
        public Home()
        {
            InitializeComponent();
        }

        async void GoToBooks(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new Book());
        }

        async void GoToLibrary(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new LibraryList());
        }

        async void GoToEvent(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new Events());
        }
    }
}