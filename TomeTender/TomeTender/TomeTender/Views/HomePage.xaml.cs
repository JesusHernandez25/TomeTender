using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TomeTender;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;


namespace TomeTender
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class HomePage : ContentPage
    {
        public HomePage()
        {
            InitializeComponent();
        }

        async void GoToLibraryListPage(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new LibraryListPage());
        }

        async void GoToEventsPage(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new EventsPage());
        }

    }

}

    



